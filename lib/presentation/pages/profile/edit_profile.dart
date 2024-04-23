import 'package:empowher/presentation/style/style.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

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
            style: TextStyle(color: Style.fern),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
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
                    Icons.add_a_photo_outlined,
                    color: Style.fern.withOpacity(.7),
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    cursorColor: Style.fern,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                      hintText: 'Ism',
                      hintStyle: TextStyle(color: Style.fern),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.fern),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.fern),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.fern),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.fern),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    cursorColor: Style.fern,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                      hintText: 'Familiya',
                      hintStyle: TextStyle(color: Style.fern),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.fern),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.fern),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.fern),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.fern),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    cursorColor: Style.fern,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                      hintText: 'Bio',
                      hintStyle: TextStyle(color: Style.fern),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.fern),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.fern),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.fern),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.fern),
                      ),
                    ),
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
