import 'package:empowher/domain/services/local_storage.dart';
import 'package:empowher/presentation/app_widget.dart';
import 'package:flutter/material.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppWidget(),
    );
  }
}
