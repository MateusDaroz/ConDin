import 'package:condin/features/auth/view/login.dart';
import 'package:condin/features/auth/view/splashscreen.dart';
import 'package:condin/features/auth/view/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(0, 200, 74, 1)),
      ),
      debugShowCheckedModeBanner: false,
      home: Login()
    );
  }
}