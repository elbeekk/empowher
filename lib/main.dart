import 'package:empowher/domain/services/local_storage.dart';
import 'package:empowher/firebase_options.dart';
import 'package:empowher/presentation/app_widget.dart';
import 'package:empowher/presentation/pages/auth/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocalStorage.getMe() != null ? const AppWidget() : const AuthPage(),
    );
  }
}
