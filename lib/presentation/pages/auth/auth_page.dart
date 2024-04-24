import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowher/application/auth/auth_bloc.dart';
import 'package:empowher/domain/models/class/user.dart';
import 'package:empowher/domain/services/local_storage.dart';
import 'package:empowher/presentation/app_widget.dart';
import 'package:empowher/presentation/style/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final emailCon = TextEditingController();

  final passwordCon = TextEditingController();

  final passwordConfirmCon = TextEditingController();

  final loginForm = GlobalKey<FormState>();
  final regForm = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo.jpg'),
                      Form(
                        key: regForm,
                        child: Column(
                          children: [
                            Form(
                              key: loginForm,
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10),
                                    child: TextFormField(
                                      controller: emailCon,
                                      cursorColor: Style.lightPink,
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return "Email must not be empty";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Style.blushPink,
                                          ),
                                        ),
                                        focusedErrorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Style.blushPink,
                                          ),
                                        ),
                                        errorStyle:
                                            TextStyle(color: Style.blushPink),
                                        hintText: 'Email',
                                        hintStyle:
                                            TextStyle(color: Style.lightPink),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Style.lightPink,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Style.lightPink,
                                          ),
                                        ),
                                        disabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Style.lightPink,
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Style.lightPink,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10),
                                    child: TextFormField(
                                      controller: passwordCon,
                                      cursorColor: Style.lightPink,
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return "Password must not be empty";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Style.blushPink,
                                          ),
                                        ),
                                        focusedErrorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Style.blushPink,
                                          ),
                                        ),
                                        errorStyle:
                                            TextStyle(color: Style.blushPink),
                                        hintStyle:
                                            TextStyle(color: Style.lightPink),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Style.lightPink,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Style.lightPink,
                                          ),
                                        ),
                                        disabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Style.lightPink,
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Style.lightPink,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (state.isRegister)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                  controller: passwordConfirmCon,
                                  cursorColor: Style.lightPink,
                                  validator: (value) {
                                    if (passwordConfirmCon.text != value) {
                                      return "Passwords must match!";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Password Confirm',
                                    hintStyle:
                                        TextStyle(color: Style.lightPink),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Style.lightPink,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Style.lightPink,
                                      ),
                                    ),
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Style.lightPink,
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Style.blushPink,
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Style.blushPink,
                                      ),
                                    ),
                                    errorStyle:
                                        TextStyle(color: Style.blushPink),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Style.lightPink,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Style.lightPink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                Timer(Duration(seconds: 2), () {
                                  setState(() {
                                    isLoading=false;
                                  });
                                });
                                UserCredential? user;
                                if (state.isRegister &&
                                    (regForm.currentState?.validate() ??
                                        false) &&
                                    (loginForm.currentState?.validate() ??
                                        false)) {
                                  try {
                                    user = await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: emailCon.text.trim(),
                                      password: passwordCon.text.trim(),
                                    );
                                  } on FirebaseException catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(e.message ?? ''),
                                        backgroundColor: Colors.red.shade300,
                                      ),
                                    );
                                  }
                                }
                                if (!state.isRegister &&
                                    (loginForm.currentState?.validate() ??
                                        false)) {
                                  try {
                                    user = await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: emailCon.text.trim(),
                                            password: passwordCon.text.trim());
                                  } on FirebaseException catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(e.message ?? ''),
                                        backgroundColor: Colors.red.shade300,
                                      ),
                                    );
                                  }
                                }
                                if (user != null) {
                                  if (state.isRegister) {
                                    try {
                                      await FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(user.user?.uid)
                                          .set(
                                            UserModel(
                                                    email: user.user?.email,
                                                    uid: user.user?.uid)
                                                .toJson(),
                                          );
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                const AppWidget(),
                                          ),
                                          (route) => false);
                                    } on FirebaseException catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(e.message ?? ''),
                                          backgroundColor: Colors.red.shade300,
                                        ),
                                      );
                                    }
                                    LocalStorage.setMe(
                                        UserModel(email: user.user?.email,uid: user.user?.uid));
                                  } else {
                                    try {
                                      final snap = await FirebaseFirestore
                                          .instance
                                          .collection('users')
                                          .doc(user.user?.uid)
                                          .get();
                                      LocalStorage.setMe(
                                        UserModel.fromJson(snap.data() ?? {}),
                                      );
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                const AppWidget(),
                                          ),
                                          (route) => false);
                                    } on FirebaseException catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(e.message ?? ''),
                                          backgroundColor: Colors.red.shade300,
                                        ),
                                      );
                                    }
                                  }
                                }
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(
                                      state.isRegister ? "Register" : "Login",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              // padding: const EdgeInsets.symmetric(horizontal:15,vertical: 1),
                              // side: BorderSide(
                              //   color: Style.lightPink
                              // ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(const AuthEvent.changePage());
                            },
                            child: Text(
                              state.isRegister ? "Login" : "Register",
                              style: TextStyle(color: Style.lightPink),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
