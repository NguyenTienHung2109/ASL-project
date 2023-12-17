import 'package:flutter/material.dart';
import 'package:signlingo/src/bloc/learning_bloc.dart';
import 'package:signlingo/src/database/learning_database.dart';
import 'package:signlingo/src/repository/video_youtube.dart';
import 'package:signlingo/src/resources/learning/learning_body/quiz/question.dart';
import 'package:signlingo/src/resources/element/video_youtube.dart';

class QuizChooseVideo extends StatefulWidget {
  late String name;
  late List<String> answers;
  late Function nextLesson;

  QuizChooseVideo(
      {Key? key,
      required this.name,
      required this.answers,
      required this.nextLesson})
      : super(key: key);

  @override
  QuizChooseVideoState createState() => QuizChooseVideoState();
}

class QuizChooseVideoState extends State<QuizChooseVideo> {
  bool isLoading = true;
  String? chooseWord;
  //dữ liệu đầu vào
  List<Widget> videoWidgets = [];

  Future<Widget> getVideo(String word) async {
    Map<String, dynamic> temp = await LearningData.getVideo(widget.name);
    if (temp.isNotEmpty) {
      return VideoYoutube(
          id: temp["id"], title: temp["title"], videoUrl: temp["link"]);
    }
    return Container();
  }

  Future<Widget> buildAnswerVideo(String answer) async {
    return TextButton(
      onPressed: () {
        setState(() {
          chooseWord = answer;
          print(chooseWord);
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: chooseWord == answer ? Colors.blue : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Container(
        height: 250,
        width: double.infinity,
        padding: EdgeInsets.all(5.0),
        child: await getVideo(answer),
      ),
    );
  }

  Future<void> init() async {
    for (int i = 0; i < widget.answers.length; i++) {
      videoWidgets.add(await buildAnswerVideo(widget.answers[i]));
    }
    widget.name = LearningBloc.toUpper(widget.name);
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
            body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    color: Colors.white,
                    child: Text(
                      "Choose the sign ${widget.name}",
                      style: TextStyle(fontSize: 22, color: Colors.black87),
                    ),
                  ),
                  ...videoWidgets
                ]),
          ));
  }
}
