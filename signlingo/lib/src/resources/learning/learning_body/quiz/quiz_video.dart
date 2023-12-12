import 'package:flutter/material.dart';
import 'package:signlingo/src/database/learning_database.dart';
import 'package:signlingo/src/repository/video_youtube.dart';
import 'package:signlingo/src/resources/learning/learning_body/quiz/question.dart';
import 'package:signlingo/src/resources/element/video_youtube.dart';

class QuizVideo extends StatefulWidget {
  late String name;
  late List<String> answers;
  late Function nextLesson;
  QuizVideo(
      {Key? key,
      required this.name,
      required this.answers,
      required this.nextLesson})
      : super(key: key);

  @override
  QuizVideoState createState() => QuizVideoState();
}

class QuizVideoState extends State<QuizVideo> {
  bool isLoading = true;
  //dữ liệu đầu vào
  Widget videoWidget = SizedBox.shrink();
  List<Map<String, bool>> answers = [
    // {"way": true},
    // {"what": false},
  ];
  Future<void> init() async {
    Map<String, dynamic> temp = await LearningData.getVideo(widget.name);
    if (temp.isNotEmpty) {
      videoWidget = VideoYoutube(
          id: temp["id"], title: temp["title"], videoUrl: temp["link"]);
      for (var e in widget.answers) {
        answers.add({e: e == widget.name});
      }
    }
    setState(() {
      isLoading = false;  
    });
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: Column(children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 200.0,
                child: videoWidget,
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
