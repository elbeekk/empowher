import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowher/domain/models/class/user.dart';
import 'package:empowher/domain/services/local_storage.dart';
import 'package:empowher/presentation/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController? lNameCon;
  TextEditingController? fNameCon;
  TextEditingController? bioCon;

  @override
  void initState() {
    lNameCon =
        TextEditingController(text: LocalStorage.getMe()?.lastName ?? '');
    fNameCon =
        TextEditingController(text: LocalStorage.getMe()?.firstName ?? '');
    bioCon = TextEditingController(text: LocalStorage.getMe()?.bio ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
            'Edit Profile',
            style: TextStyle(color: Style.fern, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
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
                if (LocalStorage.getMe()?.email != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      LocalStorage.getMe()?.email ?? "",
                      style: TextStyle(color: Style.fern),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    cursorColor: Style.fern,
                    controller: fNameCon,
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
                    controller: lNameCon,
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
                    controller: bioCon,
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
                          onPressed: () async {
                            LocalStorage.setMe(UserModel(
                              bio: bioCon?.text.trim() ?? '',
                              firstName: fNameCon?.text.trim() ?? '',
                              lastName: lNameCon?.text.trim() ?? '',
                              uid: LocalStorage.getMe()?.uid,
                              email: LocalStorage.getMe()?.email,
                            ));
                            try {
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(LocalStorage.getMe()?.uid ?? "")
                                  .update({
                                "bio": bioCon?.text.trim() ?? "",
                                "firstName": fNameCon?.text.trim() ?? "",
                                "lastName": lNameCon?.text.trim() ?? '',
                              });
                            } catch (e) {
                              print("${LocalStorage.getMe()?.uid} $e");
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Style.fern.withOpacity(.9),
                                content: const Text(
                                  "Saved",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Save",
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
