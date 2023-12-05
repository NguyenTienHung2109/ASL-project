import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/home/home.dart';
import 'package:signlingo/src/resources/login/login_page.dart';
import 'package:signlingo/src/resources/quiz/question.dart';
import 'package:signlingo/src/resources/quiz/quiz_img.dart';
import 'package:signlingo/src/resources/quiz/quiz_video.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: QuizImg()
          /*QuizPage(Url: 'https://www.youtube.com/watch?v=n1Y4HROvFME',
        answer: {
    'A. 1999': true,
    'B. 1998': false,
    'C. 1997': false,
  },
        question: "abc",
        ),*/
          ),
    );
  }
}
