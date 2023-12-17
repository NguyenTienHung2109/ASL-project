import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/home/home.dart';
import 'package:signlingo/src/resources/learning/learning.dart';
import 'package:signlingo/src/resources/learning/learning_body/quiz/choose_video.dart';
import 'package:signlingo/src/resources/login/login_page.dart';
import 'package:signlingo/src/resources/learning/learning_body/quiz/quiz_video.dart';
import 'package:signlingo/src/resources/learning/learning_body/quiz/choose_video.dart';
import 'package:signlingo/src/resources/start/start_page.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: StartPage(),
      ),
    );
  }
}
