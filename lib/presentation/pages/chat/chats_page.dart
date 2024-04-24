import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowher/domain/models/class/user.dart';
import 'package:flutter/material.dart';

import '../../../domain/services/local_storage.dart';
import '../../style/style.dart';
import 'chat_page.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        elevation: 3,
        shadowColor: Style.steelBlue.withOpacity(.4),
        centerTitle: true,
        title: Text(
          "Community",
          style: TextStyle(color: Style.steelBlue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            print(snapshot.data?.docs);
            if (snapshot.hasData && (snapshot.data?.docs.isNotEmpty ?? false)) {
              List<UserModel> list = snapshot.data?.docs
                      .map((e) => UserModel.fromJson(e.data()))
                      .toList() ??
                  [];
              list.removeWhere(
                (element) => element.uid == LocalStorage.getMe()?.uid,
              );
              return ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final current = list[index];
                  return ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    splashColor: Style.steelBlue.withOpacity(.2),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    onTap: () {
                      if ((current.uid?.isNotEmpty ?? false)) {
                        print(current.uid);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ChatPage(
                              user: current,
                            ),
                          ),
                        );
                      }
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      foregroundImage: (current?.image != null &&
                              (current?.image?.isNotEmpty ?? false))
                          ? NetworkImage(current?.image ?? "")
                          : null,
                      radius: MediaQuery.sizeOf(context).width * 0.07,
                      child: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    title: Text(
                      current?.firstName ?? current?.email ?? '',
                    ),
                    // trailing: const Icon(
                    //   Icons.circle,
                    //   size: 10,
                    //   color: Colors.red,
                    // ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
