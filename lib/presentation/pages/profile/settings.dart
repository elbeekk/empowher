import 'package:empowher/presentation/style/style.dart';
import 'package:flutter/material.dart';

import '../../../domain/services/local_storage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              color: Style.fern,
            )),
        shadowColor: Style.fern.withOpacity(.5),
        elevation: 2,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(color: Style.fern,fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vibration for disabled users",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Style.fern),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "On",
                              style: TextStyle(color: Style.fern),
                            ),
                            if (LocalStorage.getDisability())
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.circle,
                                  color: Style.fern,
                                ),
                              ),
                            if (!LocalStorage.getDisability())
                              IconButton(
                                onPressed: () {
                                  LocalStorage.setDisability(true);
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.circle_outlined,
                                  color: Style.fern,
                                ),
                              )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Off",
                              style: TextStyle(color: Style.fern),
                            ),
                            if (!LocalStorage.getDisability())
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.circle,
                                  color: Style.fern,
                                ),
                              ),
                            if (LocalStorage.getDisability())
                              IconButton(
                                onPressed: () {
                                  LocalStorage.setDisability(false);
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.circle_outlined,
                                  color: Style.fern,
                                ),
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Style.fern),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "On",
                              style: TextStyle(color: Style.fern),
                            ),
                            if (LocalStorage.getNotifications())
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.circle,
                                  color: Style.fern,
                                ),
                              ),
                            if (!LocalStorage.getNotifications())
                              IconButton(
                                onPressed: () {
                                  LocalStorage.setNotifications(true);
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.circle_outlined,
                                  color: Style.fern,
                                ),
                              )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Off",
                              style: TextStyle(color: Style.fern),
                            ),
                            if (!LocalStorage.getNotifications())
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.circle,
                                  color: Style.fern,
                                ),
                              ),
                            if (LocalStorage.getNotifications())
                              IconButton(
                                onPressed: () {
                                  LocalStorage.setNotifications(false);
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.circle_outlined,
                                  color: Style.fern,
                                ),
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
