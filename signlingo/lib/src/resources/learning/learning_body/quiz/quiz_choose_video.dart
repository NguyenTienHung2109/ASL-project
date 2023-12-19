import 'package:flutter/material.dart';
import 'package:signlingo/src/bloc/learning_bloc.dart';
import 'package:signlingo/src/database/learning_database.dart';
import 'package:signlingo/src/repository/video_youtube.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/check_footer.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/correct_footer.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/incorrect_footer.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/loading_footer.dart';
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
  String chooseWord = "";
  int selectedVideoIndex = -1;
  Widget _footer = SizedBox.shrink();
  bool _isChecking = false;
  bool _result = false;
  bool _checked = false;
  LearningBloc _bloc = LearningBloc();
  void selectVideo(int index) {
    setState(() {
      selectedVideoIndex = index;
    });
  }

  Future<void> checkLesson() async {
    if (chooseWord.isNotEmpty && !_checked) {
      setState(() {
        _isChecking = true;
        _checked = true;
      });
      _result = await _bloc.checkString(chooseWord, widget.name);
      print(chooseWord);
      setState(() {
        _isChecking = false;
      });
    }
  }

  Widget buildVideoItem(int index) {
    bool isSelected = selectedVideoIndex == index;
    return GestureDetector(
      onTap: () {
        if (!_checked) {
          selectVideo(index);
          chooseWord = widget.answers[index];
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.transparent,
            width: 10.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(3.0),
        child: VideoYoutube(widget.answers[index]),
      ),
    );
  }

  Future<Widget> getVideo(String word) async {
    return VideoYoutube(word);
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
    // for (int i = 0; i < widget.answers.length; i++) {
    //   videoWidgets.add(CustomAnswer(
    //       word: widget.answers[i],
    //       onClick: () {
    //         for (int j = 0; j < videoWidgets.length; j++) {
    //           setState(() {
    //             videoWidgets[j].check(false);
    //           });
    //         }
    //         setState(() {
    //           chooseWord = videoWidgets[i].getWord();
    //           videoWidgets[i].check(true);
    //         });
    //       }));
    // }
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
    if (chooseWord.isNotEmpty) {
      setState(() {
        if (!_checked) {
          _footer = CheckFooter(checkLesson: () async {
            await checkLesson();
          });
        } else {
          if (_isChecking) {
            _footer = LoadingFooter();
          } else {
            if (_result) {
              _footer = CorrectFooter(nextLesson: () {
                widget.nextLesson();
              });
            } else {
              _footer = IncorrectFooter(
                  nextLesson: () {
                    widget.nextLesson();
                  },
                  resetLesson: () {},
                  type: true);
            }
          }
        }
      });
    }
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
                    Column(
                      children:
                          List.generate(2, (index) => buildVideoItem(index)),
                    )
                  ]),
            ),
            bottomNavigationBar: AnimatedSwitcher(
              duration: Duration(microseconds: 600),
              child: _footer,
            ),
          );
  }
}
