import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/quiz/question.dart';
import 'package:signlingo/src/resources/element/video_youtube.dart';

class QuizImg extends StatefulWidget {
  const QuizImg({super.key});

  @override
  QuizImgState createState() => QuizImgState();
}

class QuizImgState extends State<QuizImg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image(
          image: NetworkImage(
              'https://i.pinimg.com/564x/38/06/27/380627e32b6929506158183ca94b7b31.jpg'),
          fit: BoxFit.cover,
        ),
        Expanded(child: QuestionPage()),
      ]),
    );
  }
}
