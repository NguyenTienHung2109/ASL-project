import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/element/video_youtube.dart';
import 'package:signlingo/src/bloc/quiz_bloc.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/check_footer.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/correct_footer.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/incorrect_footer.dart';

class QuestionPage extends StatefulWidget {
  late List<Map<String, bool>> answers;
  late Function nextLesson;
  QuestionPage({Key? key, required this.answers, required this.nextLesson}) : super(key: key);
  @override
  State<QuestionPage> createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> {
  Widget _footer = SizedBox.shrink();
  QuizBloc bloc = new QuizBloc();
  bool check = false;
  String? selectedAnswer;
  bool isCorrect = false; //check đáp án
  @override
  Widget build(BuildContext context) {
    setState(() {
      if (!isCorrect) {
        _footer = CheckFooter(checkLesson: () async {
          await checkQuiz();
        });
      } else {
        _footer = CorrectFooter(nextLesson: () {
          widget.nextLesson();
        });
        // if (isCorrect) {
        //   _footer = LoadingFooter();
        // } else {
        //   if (_result) {
        //     _footer = CorrectFooter(nextLesson: () {
        //       widget.nextLesson();
        //     });
        //   } else {
        //     _footer = IncorrectFooter(
        //         nextLesson: () {
        //           widget.nextLesson();
        //         },
        //         resetLesson: () {
        //           widget.resetLesson();
        //         },
        //         type: false);
        //   }
        // }
      }
    });
    return Scaffold(
        body: Center(
          child: Column(children: [
            // Container(
            //   height: 200.0,
            //   child: YoutubePlayerExample(
            //     videoUrl: "https://www.youtube.com/watch?v=-oGnIDH1aeA",
            //   ),
            // ),
            // Container(child: ChooseQuizPage(),
            // height: 200,),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Đây là từ gì?',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Container(
              width: 400,
              child: StreamBuilder(
                  stream: bloc.checkStream,
                  builder: (context, snapshot) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (var answer in widget.answers)
                            buildAnswerButton(answer.keys.first),
                          SizedBox(
                            height: 20,
                            width: 200,
                          ),
                          // CheckFooter(checkLesson: () async {
                          //   await checkQuiz();
                          // })
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //       minimumSize: const Size(20, 40)),
                          //   onPressed: () {
                          //     onClickButton();
                          //   },
                          //   child: Text('Check Answer'),
                          // ),
                          // SizedBox(height: 20),
                          // check
                          //     ? Text(
                          //         'Đáp án đúng: ${isCorrect?.toString() ?? ""}',
                          //         style: TextStyle(
                          //           color: isCorrect == true
                          //               ? Colors.green
                          //               : isCorrect == false
                          //                   ? Colors.red
                          //                   : null,
                          //           fontSize: 18,
                          //         ),
                          //       )
                          //     : Text(""),
                        ],
                      )),
            ),
          ]),
        ),
        bottomNavigationBar: AnimatedSwitcher(
          duration: Duration(milliseconds: 600),
          child: _footer,
        ));
  }

  Widget buildAnswerButton(String answer) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            selectedAnswer = answer;
          });
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(
              width: 2,
              color: selectedAnswer == answer
                  ? Colors.amber.shade200
                  : Colors.blue),
          //primary: selectedAnswer == answer ? Colors.yellow : null,
          minimumSize: const Size(800, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          answer,
          style: TextStyle(fontSize: 25, color: Colors.black87),
        ),
      ),
    );
  }

  void onClickButton() {
    setState(() {
      check = true;
      // Kiểm tra xem đáp án đã chọn có đúng hay không
      if (bloc.isCheck(
          widget.answers
              .firstWhere((answer) => answer.keys.first == selectedAnswer)
              .values
              .first,
          selectedAnswer))
        isCorrect = true;
      else
        isCorrect = false;
    });
  }

  Future<void> checkQuiz() async {
    setState(() {
      isCorrect = true;
      widget.nextLesson;
    });
    // if (_doneRecorded && !_checked) {
    //   setState(() {
    //     _checked = true;
    //     _isChecking = true;
    //   });
    //   _result = await _bloc.isCorrectVideo(file, widget.name);
    //   setState(() {
    //     _isChecking = false;
    //   });
    // }
  }
}
