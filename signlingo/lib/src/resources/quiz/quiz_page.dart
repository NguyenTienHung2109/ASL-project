import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/element/video_youtube.dart';
import 'package:signlingo/src/bloc/quiz_bloc.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  @override
  State<QuizPage> createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  QuizBloc bloc = new QuizBloc();

  List<Map<String, bool>> answers = [
    {"1997": true},
    {"1887": false},
    {"1998": false},
  ];
  bool check = false;
  String? selectedAnswer;
  bool isCorrect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        height: 200.0,
        child: YoutubePlayerExample(
          videoUrl: "https://www.youtube.com/watch?v=-oGnIDH1aeA",
        ),
      ),
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Năm sinh của bạn A là?',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      Container(
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var answer in answers) buildAnswerButton(answer.keys.first),
            SizedBox(
              height: 20,
              width: 200,
            ),
            StreamBuilder(
                stream: bloc.checkStream,
                builder: (context, snapshot) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(20, 40)),
                      onPressed: () {
                        setState(() {
                          check = true;
                          // Kiểm tra xem đáp án đã chọn có đúng hay không
                          if (answers
                                  .firstWhere((answer) =>
                                      answer.keys.first == selectedAnswer)
                                  .values
                                  .first &&
                              selectedAnswer != null)
                            isCorrect = true;
                          else
                            isCorrect = false;
                        });
                      },
                      child: Text('Check Answer'),
                    )),
            SizedBox(height: 20),
            // Hiển thị true nếu đáp án đúng và false nếu đáp án sai
            check
                ? Text(
                    'Đáp án đúng: ${isCorrect?.toString() ?? ""}',
                    style: TextStyle(
                      color: isCorrect == true
                          ? Colors.green
                          : isCorrect == false
                              ? Colors.red
                              : null,
                      fontSize: 18,
                    ),
                  )
                : Text(""),
          ],
        ),
      ),
    ]));
  }

  Widget buildAnswerButton(String answer) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedAnswer = answer;
        });
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(
            width: 2,
            color: selectedAnswer == answer ? Colors.orange : Colors.blue),
        //primary: selectedAnswer == answer ? Colors.yellow : null,
        minimumSize: const Size(200, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(answer),
    );
  }
}
