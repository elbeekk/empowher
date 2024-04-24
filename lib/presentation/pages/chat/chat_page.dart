import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowher/domain/models/class/chat.dart';
import 'package:empowher/domain/models/class/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../../../domain/services/local_storage.dart';
import '../../style/style.dart';

class ChatPage extends StatefulWidget {
  final UserModel user;

  const ChatPage({super.key, required this.user});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String? chatId;

  final controller = TextEditingController();

  createChat() async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .get();
      if (!snap.exists) {
        FirebaseFirestore.instance.collection('chats').doc(chatId).set(
              ChatModel(users: [
                widget.user.uid ?? '',
                LocalStorage.getMe()?.uid ?? ''
              ], messages: [
                Message(
                  text: "Chat created",
                  date: DateTime.now().toString(),
                  read: false,
                  owner: '',
                )
              ]).toJson(),
            );
      }
    } catch (e) {
      await FirebaseFirestore.instance.collection('chats').doc(chatId).set(
            ChatModel(users: [
              widget.user.uid ?? '',
              LocalStorage.getMe()?.uid ?? ''
            ], messages: [
              Message(
                text: "Chat created",
                date: DateTime.now().toString(),
                read: false,
                owner: '',
              )
            ]).toJson(),
          );
    }
    setState(() {});
  }

  @override
  void initState() {
    List<String> users = [
      LocalStorage.getMe()?.uid ?? '',
      widget.user.uid ?? ''
    ];
    users.sort();
    chatId = users.join('_');
    print([LocalStorage.getMe()?.uid ?? '', widget.user.uid ?? '']);
    createChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Style.steelBlue.withOpacity(.3),
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
                cursorColor: Style.steelBlue,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  fillColor: Style.steelBlue.withOpacity(.2),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Style.steelBlue.withOpacity(.2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Style.steelBlue.withOpacity(.2),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Style.steelBlue.withOpacity(.2),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Style.steelBlue.withOpacity(.2),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (chatId?.isNotEmpty ?? false) {
                  try {
                    FirebaseFirestore.instance
                        .collection('chats')
                        .doc(chatId)
                        .update({
                      "messages": FieldValue.arrayUnion([
                        Message(
                          text: controller.text.trim(),
                          date: DateTime.now().toString(),
                          owner: LocalStorage.getMe()?.uid,
                          read: false,
                        ).toJson()
                      ])
                    });
                    controller.clear();
                  } catch (e) {}
                }
              },
              icon: Icon(
                Icons.send,
                color: Style.steelBlue,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Style.steelBlue,
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.user.firstName ?? widget.user.email ?? '',
          style: TextStyle(color: Style.steelBlue),
        ),
        elevation: 3,
        shadowColor: Style.steelBlue.withOpacity(.6),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .doc(chatId)
            .snapshots(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData && (snapshot.data?.exists ?? false)) {
            final chat = ChatModel.fromJson(snapshot.data?.data() ?? {});
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              itemCount: chat.messages?.length ?? 0,
              reverse: true,
              itemBuilder: (context, index) {
                final message = chat.messages?.reversed.toList()[index];
                final bool isMine = message?.owner == LocalStorage.getMe()?.uid;
                final bool isFriend = message?.owner == widget.user.uid;
                final bool isChat = !isMine && !isFriend;
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
                                    ? Colors.blue.shade300.withOpacity(.8)
                                    : Colors.grey.shade300,
                          ),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.sizeOf(context).width * 0.6,
                            minWidth: MediaQuery.sizeOf(context).width * 0.2,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          padding: isChat
                              ? const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5)
                              : const EdgeInsets.only(
                                  right: 20, bottom: 20, left: 10, top: 5),
                          child: Text(
                            message?.text ?? "",
                          ),
                        ),
                        if (!isChat)
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: Row(
                              children: [
                                Text(
                                  DateFormat('HH:MM').format(
                                      DateTime.parse(message?.date ?? "")),
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Style.steelBlue.withOpacity(.7),
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  (message?.read ?? false)
                                      ? Icons.done_all
                                      : Icons.done,
                                  size: 15,
                                  color: Style.steelBlue.withOpacity(.7),
                                )
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
          return Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: Style.steelBlue,
                strokeWidth: 1.4,
              ),
            ),
          );
        },
      ),
    );
  }
}
