import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/learning/learning_body/practice_page.dart';
import 'package:signlingo/src/resources/learning/learning_body/study_page.dart';
import 'package:signlingo/src/resources/learning/learning_menu.dart';

// ignore: must_be_immutable
class Learning extends StatefulWidget {
  bool isHiding = true;
  bool isSlow = false;
  int complete = 0;
  late int total;

  Learning({super.key, required this.total});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LearningState();
  }
}

class _LearningState extends State<Learning> {
  Widget _currentWidget = SizedBox.shrink();

  @override
  void initState() {
    super.initState();

    _currentWidget = StudyPage(
      name: "DEAF",
      nextLesson: () {
        increment();
        updateWidget();
      },
    );
  }

  void increment() {
    setState(() {
      widget.complete++;
      print(widget.complete);
      if (widget.complete > widget.total) {
        widget.complete = widget.total;
      }
    });
  }

  void updateWidget() {
    setState(() {
      if (widget.complete == 1) {
        _currentWidget = StudyPage(
          name: "HEARING",
          nextLesson: () {
            increment();
            updateWidget();
          },
        );
      }
      if (widget.complete == 2) {
        _currentWidget = PracticePage(
          name: "DEAF",
          nextLesson: () {
            increment();
            updateWidget();
          },
        );
      }
    });
  }

  // List<String> sceriano = [
  //   StudyPage(
  //     name: "DEAF",
  //     nextLesson: () {
  //       increment();
  //     },
  //   ),
  //   PracticePage(
  //     name: "DEAF",
  //     nextLesson: () {
  //       increment();
  //     },
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
            duration: Duration(milliseconds: 400),
            child: _currentWidget,
          ),
        ));
  }
}
