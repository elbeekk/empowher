import 'dart:async';

import 'package:empowher/application/bottom_nav/bottom_nav_bloc.dart';
import 'package:empowher/domain/services/local_storage.dart';
import 'package:empowher/presentation/pages/connect/connect_page.dart';
import 'package:empowher/presentation/pages/home/home_page.dart';
import 'package:empowher/presentation/pages/profile/profile_page.dart';
import 'package:empowher/presentation/pages/safety/safety_page.dart';
import 'package:empowher/presentation/pages/wellness/wellness.dart';
import 'package:empowher/presentation/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibration/vibration.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final con = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          Color unselectedColor = Style.lightPink;
          Color selectedColor = Style.blushPink;
          if (state.currentIndex == 4) {
            unselectedColor = Style.fern.withOpacity(.6);
            selectedColor = Style.fern;
          }
          if (state.currentIndex == 2) {
            unselectedColor = Colors.red.withOpacity(.6);
            selectedColor = Colors.red;
          }
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.currentIndex,
                selectedItemColor: selectedColor,
                unselectedItemColor: unselectedColor,
                onTap: (value) {
                  context
                      .read<BottomNavBloc>()
                      .add(BottomNavEvent.changeIndex(value));
                  con.jumpToPage(value);
                  // con.animateToPage(value,
                  //     duration: const Duration(milliseconds: 500),
                  //     curve: Curves.easeInOut);
                },
                showUnselectedLabels: true,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.health_and_safety_outlined),
                      label: 'Safety'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline), label: 'Profile'),
                ]),
            body: PageView(
              controller: con,
              onPageChanged: (value) {
                if (LocalStorage.getDisability()) {
                  Vibration.vibrate(
                      pattern: List.generate(value + 2, (index) => 100),
                      intensities:
                          List.generate(value + 2, (index) => index * 30));
                }
                context
                    .read<BottomNavBloc>()
                    .add(BottomNavEvent.changeIndex(value));
              },
              children: const [
                HomePage(),
                SafetyPage(),
                ProfilePage(),
              ],
            ),
          );
        },
      ),
    );
  }
}
