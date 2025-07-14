import 'package:condin/features/auth/view/login.dart';
import 'package:condin/features/auth/view/register.dart';
import 'package:condin/features/auth/view/splashscreen.dart';
import 'package:condin/features/auth/view/welcome.dart';
import 'package:condin/features/themes/theme.dart';
import 'package:condin/features/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: Splashscreen()
    );
  }
}