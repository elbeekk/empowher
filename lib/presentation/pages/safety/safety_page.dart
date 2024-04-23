import 'dart:async';
import 'dart:ui';

import 'package:empowher/domain/services/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:geolocator/geolocator.dart';

import '../../style/style.dart';

class SafetyPage extends StatefulWidget {
  const SafetyPage({super.key});

  @override
  State<SafetyPage> createState() => _SafetyPageState();
}

class _SafetyPageState extends State<SafetyPage> {
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  StreamSubscription<Position>? positionStream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: LocalStorage.getSharing()
            ? Colors.green.shade300
            : Colors.red.shade300,
        title: const Text(
          "Safety",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (!LocalStorage.getSharing()) {
                  Permission.location.request();
                  Permission.locationAlways.request();
                  Permission.locationWhenInUse.request();
                  positionStream = Geolocator.getPositionStream(
                          locationSettings: locationSettings)
                      .listen((Position? position) {
                    print(position == null
                        ? 'Unknown'
                        : '${position.latitude.toString()}, ${position.longitude.toString()}');
                  });
                } else {
                  positionStream?.pause();
                }
                LocalStorage.setSharing(!LocalStorage.getSharing());
                setState(() {});
              },
              icon: Icon(
                LocalStorage.getSharing()
                    ? Icons.location_on_outlined
                    : Icons.location_off_outlined,
                color: Colors.white,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.sos,
            size: 25,
            color: Colors.white,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.sizeOf(context).height * 0.43,
                    right: 30,
                    left: 30),
                behavior: SnackBarBehavior.floating,
                content: const Text(
                  "Alert sent to your trusted contacts",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trusted contacts",
                    style: TextStyle(
                      color: Style.blushPink,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        final permission =
                            await FlutterContacts.requestPermission();
                        Permission.contacts.request();
                        if (permission) {
                          final smth = await FlutterContacts.getContacts();
                          if (smth.isNotEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                List<Contact> selected = [];
                                return StatefulBuilder(
                                  builder: (context, setState1) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      content: ListView.builder(
                                        itemCount: smth.length,
                                        itemBuilder: (context, index) {
                                          final current = smth[index];
                                          return ListTile(
                                            onTap: () {
                                              if (selected.contains(current)) {
                                                selected.remove(current);
                                              } else {
                                                selected.add(current);
                                              }
                                              setState1(() {});
                                            },
                                            leading: Icon(
                                                selected.contains(current)
                                                    ? Icons.circle
                                                    : Icons.circle_outlined),
                                            title: Text(current.displayName),
                                          );
                                        },
                                      ),
                                      actions: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  LocalStorage.setContacts(
                                                      selected
                                                          .map((e) =>
                                                              e.displayName)
                                                          .toList());
                                                  setState(() {

                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Add"),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          }
                        }
                      },
                      icon: Icon(
                        Icons.add_circle_outline_rounded,
                        color: Style.blushPink,
                      ))
                ],
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: LocalStorage.getContacts().length,
                  itemBuilder: (context, index) {
                    final current = LocalStorage.getContacts()[index];
                    return ListTile(
                      title: Text(current),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
