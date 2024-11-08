import 'package:ecom_task/screens/home_screen.dart';
import 'package:ecom_task/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task',
     
      themeMode: ThemeMode.system,
      theme: ThemeData(textTheme: TextTheme(bodyLarge: TextStyle(fontSize: 14 * 1.0))),
      home:  LoadingScreen(),
    );
  }
}

