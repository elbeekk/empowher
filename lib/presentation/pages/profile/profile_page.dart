import 'package:empowher/domain/services/local_storage.dart';
import 'package:empowher/presentation/pages/profile/edit_profile.dart';
import 'package:empowher/presentation/pages/profile/settings.dart';
import 'package:empowher/presentation/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // backgroundColor: Colors.blue,
        appBar: AppBar(
          shadowColor: Style.fern.withOpacity(.5),
          elevation: 2,
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(color: Style.fern,fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).width * 0.2,
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 2,
                              color: Style.fern.withOpacity(.5)),
                        ],
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: Style.fern.withOpacity(.7),
                        size: 50,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${LocalStorage.getMe()?.firstName ?? ""} ${LocalStorage.getMe()?.lastName ?? ''}",
                      style: TextStyle(color: Style.fern, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Style.fern.withOpacity(.2),
                              elevation: 1,
                              shadowColor: Style.fern.withOpacity(.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const EditProfilePage(),
                              ),
                            ).whenComplete(() {
                              setState(() {});
                            });
                          },
                          child: Text(
                            "Edit profile",
                            style: TextStyle(color: Style.fern),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Style.fern.withOpacity(.2),
                              elevation: 1,
                              shadowColor: Style.fern.withOpacity(.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => SettingsPage(),));
                          },
                          child: Text(
                            "Settings",
                            style: TextStyle(color: Style.fern),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
