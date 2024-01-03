import 'package:flutter/material.dart';
import 'package:signlingo/src/bloc/learning_bloc.dart';
import 'package:signlingo/src/database/learning_database.dart';
import 'package:signlingo/src/resources/learning/learning_body/practice_page.dart';
import 'package:signlingo/src/resources/learning/learning_body/quiz/quiz_choose_video.dart';
import 'package:signlingo/src/resources/learning/learning_body/study_page.dart';
import 'package:signlingo/src/resources/learning/learning_menu.dart';
import 'package:signlingo/src/resources/learning/learning_body/quiz/quiz_video.dart';
import 'package:signlingo/src/resources/learning/learning_body/quiz/quiz_img.dart';

import '../home/unit.dart';

// ignore: must_be_immutable
class Learning extends StatefulWidget {
  bool isHiding = true;
  bool isSlow = false;
  int complete = -1;
  late int unit;
  late int chapter;
  late String name;
  int total = 0;
  Learning(
      {super.key,
      required this.chapter,
      required this.name,
      required this.unit});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LearningState();
  }
}

class _LearningState extends State<Learning> {
  Widget _currentWidget = SizedBox.shrink();
  bool _isExit = false;
  bool isLoading = true;
  List<dynamic> scenario = [];
  int _score = 0;
  Future<void> init() async {
    scenario =
        await LearningData.getPart(widget.unit, widget.chapter, widget.name);
    setState(() {
      widget.total = scenario.length;
      isLoading = false;
    });
    // print(widget.total);
    updateWidget();
  }

  void updateWidget() async {
    await increment();
    if (_isExit) {
      _currentWidget = Container();
      return;
    }

    if (widget.name == "Review") {
      _currentWidget = PracticePage(
          name: scenario[widget.complete],
          nextLesson: () {
            // increment();
            updateWidget();
      });
      return ;
    }
    Map<String, dynamic> temp = scenario[widget.complete];
    String type = temp["type"];
    if (type == "study") {
      _currentWidget = StudyPage(
          name: temp["name"],
          nextLesson: () {
            // increment();
            updateWidget();
          });
    }

    if (type == "quiz_word") {
      _currentWidget = QuizVideo(
          name: temp["video"],
          answers: LearningBloc.dynamicToStringList(temp["word"]),
          nextLesson: () {
            // increment();
            updateWidget();
          });
    }

    if (type == "quiz_video") {
      _currentWidget = QuizChooseVideo(
          name: temp["word"],
          answers: LearningBloc.dynamicToStringList(temp["video"]),
          nextLesson: () {
            // increment();
            updateWidget();
          });
    }
    
    if (type == "quiz_img") {
      _currentWidget = QuizImg(
          name: temp["name"],
          answers: LearningBloc.dynamicToStringList(temp["image"]),
          correctIndex: temp["correctAns"],
          nextLesson: () {
            // increment();
            updateWidget();
          });
    }
    

  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> increment() async {
    setState(() {
      widget.complete++;
      // print(widget.complete);
      if (widget.complete == scenario.length) {
        setState(() {
          _isExit = true;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    if (_isExit) {
      Future.delayed(Duration.zero, () {
      Navigator.pop(context, TwoValues(widget.complete == scenario.length, _score));
    });
    }
    // TODO: implement build
    return isLoading
        ? Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return LearningMenu(); // Sử dụng CustomDialog ở đây
                      },
                    );
                  },
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                          child: SizedBox(
                              width: 290,
                              height: 15,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  value: 1.0 * widget.complete / widget.total,
                                  // value: 0.3,
                                  backgroundColor: Colors.amber.shade100,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.amber.shade800),
                                ),
                              ))),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              widget.isSlow = !widget.isSlow;
                            });
                          },
                          child: Icon(
                            Icons.slow_motion_video_outlined,
                            color: widget.isSlow
                                ? Colors.amber.shade800
                                : Colors.grey.shade400,
                          ))
                    ],
                  )
                ],
              ),
              // bottomNavigationBar: NextFooter(nextLesson: () {
              //   increment();
              // }),
              body: AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: Container(
                    key: ValueKey<int>(widget.complete), child: _currentWidget),
              ),
            ));
  }
}
