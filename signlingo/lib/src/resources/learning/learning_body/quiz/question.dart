import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/element/video_youtube.dart';
import 'package:signlingo/src/bloc/quiz_bloc.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/check_footer.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/correct_footer.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/incorrect_footer.dart';

class QuestionPage extends StatefulWidget {
  late List<Map<String, bool>> answers;
  late Function nextLesson;
  late Function resetLesson;
  QuestionPage({Key? key, required this.answers, required this.nextLesson})
      : super(key: key);
  @override
  State<QuestionPage> createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> {
  Widget _footer = SizedBox.shrink();
  QuizBloc bloc = new QuizBloc();
  bool check = false;
  bool _checked = false;
  bool checkClick = false; //kiểm tra đã chọn đáp án chưa
  String? selectedAnswer;
  bool isCorrect = false; //check đáp án
  @override
  Widget build(BuildContext context) {
    setState(() {
      if (checkClick) {
        if (!_checked) {
          _footer = CheckFooter(checkLesson: () async {
            await checkQuiz();
          });
        } else {
          if (isCorrect) {
            _footer = CorrectFooter(nextLesson: () {
              widget.nextLesson();
            });
          } else {
            _footer = IncorrectFooter(
                nextLesson: () {
                  widget.nextLesson();
                },
                resetLesson: () {
                  widget.resetLesson();
                },
                type: true);
          }
        }
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
                'Choose the correct word!',
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
                        ],
                      )),
            ),
          ]),
        ),
        bottomNavigationBar: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: _footer,
        ));
  }

  Widget buildAnswerButton(String answer) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            checkClick = true;
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
      _checked = true;
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
      _checked = true;
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
}
