import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowher/domain/models/class/chat.dart';
import 'package:empowher/domain/models/class/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:intl/intl.dart';
import '../../../domain/services/local_storage.dart';
import '../../style/style.dart';

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final controller = TextEditingController();
  final gemini = Gemini.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Style.indigo.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 2),
          ]),
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          height: MediaQuery.sizeOf(context).height * 0.1,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.attach_file,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  cursorColor: Style.indigo,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    fillColor: Style.indigo.withOpacity(.07),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Style.indigo.withOpacity(.2),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Style.indigo.withOpacity(.2),
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Style.indigo.withOpacity(.2),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Style.indigo.withOpacity(.2),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  if (controller.text.trim().isNotEmpty) {
                    final text = controller.text.trim();
                    controller.clear();
                    try {
                      FirebaseFirestore.instance
                          .collection('ai')
                          .doc(LocalStorage.getMe()?.uid)
                          .update({
                        "messages": FieldValue.arrayUnion([
                          {
                            "date": DateTime.now().toString(),
                            "isMine": true,
                            "text": text,
                          }
                        ])
                      });
                    } catch (e) {
                      FirebaseFirestore.instance
                          .collection('ai')
                          .doc(LocalStorage.getMe()?.uid)
                          .set({
                        "messages": FieldValue.arrayUnion([
                          {
                            "date": DateTime.now().toString(),
                            "isMine": true,
                            "text": text,
                          }
                        ])
                      });
                    }
                    print("tokens: ${await gemini.countTokens(text)}");
                  }
                },
                icon: Icon(
                  Icons.send,
                  color: Style.indigo,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Gemini AI",
            style: TextStyle(color: Style.indigo),
          ),
          elevation: 3,
          shadowColor: Style.indigo.withOpacity(.6),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('ai')
              .doc(LocalStorage.getMe()?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            print(snapshot.data?.data());

            if (snapshot.hasData) {
              if (snapshot.data?.data() == null) {
                FirebaseFirestore.instance
                    .collection('ai')
                    .doc(LocalStorage.getMe()?.uid)
                    .set({"messages": []});
                return Center(
                    child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                    color: Style.indigo,
                    strokeWidth: 1,
                  ),
                ));
              } else {
                List messages = snapshot.data?.data()?['messages'];
                messages = messages.reversed.toList();
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final current = messages[index];
                    gemini.chat([
                      Content(
                        role: current['isMine'] ? 'user' : "model",
                        parts: [
                          Parts(
                            text: current['text'],
                          ),
                        ],
                      ),
                    ]);
                    final bool isMine = current?['isMine'] ?? false;
                    final bool isFriend = !(current['isMine'] ?? true);
                    final bool isChat = current['isMine'] == null;
                    return Row(
                      mainAxisAlignment: isMine
                          ? MainAxisAlignment.end
                          : isFriend
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: const Radius.circular(10),
                                  topLeft: const Radius.circular(10),
                                  bottomLeft: Radius.circular(isMine
                                      ? 10
                                      : isChat
                                          ? 10
                                          : 0),
                                  bottomRight: Radius.circular(isFriend
                                      ? 10
                                      : isChat
                                          ? 10
                                          : 0),
                                ),
                                color: isChat
                                    ? Colors.grey.shade300
                                    : !isMine
                                        ? Style.indigo.withOpacity(.2)
                                        : Style.indigo.withOpacity(.4),
                              ),
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.sizeOf(context).width * 0.6,
                                minWidth:
                                    MediaQuery.sizeOf(context).width * 0.2,
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              padding: isChat
                                  ? const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5)
                                  : const EdgeInsets.only(
                                      right: 20, bottom: 20, left: 10, top: 5),
                              child: Text(
                                current['text'],
                              ),
                            ),
                            if (!isChat)
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Row(
                                  children: [
                                    Text(
                                      DateFormat('HH:MM').format(DateTime.parse(
                                          current['date'] ?? '')),
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Style.indigo,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              }
            }
            return Center(
                child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                color: Style.indigo,
                strokeWidth: 1,
              ),
            ));
          },
        ),
      ),
    );
  }
}
