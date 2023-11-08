import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/home/home.dart';
import 'package:signlingo/src/resources/login/login_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: LoginPage(),
      ),
    );
  }
}