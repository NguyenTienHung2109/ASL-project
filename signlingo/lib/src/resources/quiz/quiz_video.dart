import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/quiz/question.dart';
import 'package:signlingo/src/resources/element/video_youtube.dart';

class QuizVideo extends StatefulWidget {
  const QuizVideo({super.key});

  @override
  QuizVideoState createState() => QuizVideoState();
}

class QuizVideoState extends State<QuizVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 200.0,
          child: YoutubePlayerExample(
            videoUrl: "https://www.youtube.com/watch?v=GhX6yIBXIWQ",
          ),
        ),
        Expanded(child: QuestionPage()),
      ]),
    );
  }
}
