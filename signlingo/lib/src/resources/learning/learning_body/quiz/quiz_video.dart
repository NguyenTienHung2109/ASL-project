import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/learning/learning_body/quiz/question.dart';
import 'package:signlingo/src/resources/element/video_youtube.dart';

class QuizVideo extends StatefulWidget {
  late Function nextLesson;
  QuizVideo({Key? key, required this.nextLesson}) : super(key: key);

  @override
  QuizVideoState createState() => QuizVideoState();
}

class QuizVideoState extends State<QuizVideo> {
  //dữ liệu đầu vào
  List<Map<String, bool>> answers = [
    {"way": true},
    {"what": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 200.0,
          child: YoutubePlayerExample(
            videoUrl: "https://www.youtube.com/watch?v=GhX6yIBXIWQ",
          ),
        ),
        Expanded(
            child: QuestionPage(
          answers: answers,
          nextLesson: widget.nextLesson,
        )),
      ]),
    );
  }
}
