import 'package:empowher/application/bottom_nav/bottom_nav_bloc.dart';
import 'package:empowher/presentation/pages/ai_chat/ai_page.dart';
import 'package:empowher/presentation/pages/home/home_page.dart';
import 'package:empowher/presentation/pages/profile/profile_page.dart';
import 'package:empowher/presentation/pages/safety/safety_page.dart';
import 'package:empowher/presentation/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          if (state.currentIndex == 3) {
            unselectedColor = Style.fern.withOpacity(.5);
            selectedColor = Style.fern;
          }
          if (state.currentIndex == 2) {
            unselectedColor = Colors.red.withOpacity(.5);
            selectedColor = Colors.red;
          }if (state.currentIndex == 1) {
            unselectedColor = Style.indigo.withOpacity(.5);
            selectedColor = Style.indigo;
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
                      icon: Icon(CupertinoIcons.wand_stars), label: 'AI Chat'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.health_and_safety_outlined),
                      label: 'Safety'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline), label: 'Profile'),
                ]),
            body: PageView(
              controller: con,
              onPageChanged: (value) {
                // if (LocalStorage.getDisability()) {
                //   Vibration.vibrate(
                //       pattern: List.generate(value + 2, (index) => 100),
                //       intensities:
                //           List.generate(value + 2, (index) => index * 30));
                // }
                context
                    .read<BottomNavBloc>()
                    .add(BottomNavEvent.changeIndex(value));
              },
              children: const [
                HomePage(),
                AiChatPage(),
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
