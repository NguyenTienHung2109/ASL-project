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

import '../../../../repository/image.dart';

class QuizImg extends StatefulWidget {
  late String name;
  late List<String> answers;
  late int correctIndex;
  late Function nextLesson;

  QuizImg(
      {Key? key,
        required this.name,
        required this.answers,
        required this.correctIndex,
        required this.nextLesson})
      : super(key: key);

  @override
  QuizImgState createState() => QuizImgState();
}

class QuizImgState extends State<QuizImg> {
  bool isLoading = true;
  int selectedImgIndex = -1;
  Widget _footer = SizedBox.shrink();
  bool _isChecking = false;
  bool _result = false;
  bool _checked = false;
  LearningBloc _bloc = LearningBloc();
  void selectImage(int index) {
    setState(() {
      selectedImgIndex = index;
    });
  }

  Future<void> checkLesson() async {
    if (selectedImgIndex != -1 && !_checked) {
      setState(() {
        _isChecking = true;
        _checked = true;
      });
      _result = await _bloc.checkIndex(selectedImgIndex, widget.correctIndex);
      // print(chooseWord);
      setState(() {
        _isChecking = false;
      });
    }
  }

  Widget buildImagetem(int index) {
    bool isSelected = selectedImgIndex == index;
    return GestureDetector(
      onTap: () {
        if (!_checked) {
          selectImage(index);
          // chooseWord = widget.answers[index];
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
        child: Img(url: widget.answers[index]),
      ),
    );
  }

  Future<Widget> getVideo(String word) async {
    return VideoYoutube(word);
  }

  Future<Widget> getImage(String base64) async {
    return Img(url: base64);
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
    if (selectedImgIndex != -1) {
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
                  "Choose the correct image",
                  style: TextStyle(fontSize: 22, color: Colors.black87),
                ),
              ),
              VideoYoutube(widget.name),
              Container(
                height: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:
                  List.generate(2, (index) => buildImagetem(index)),
                ),
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
