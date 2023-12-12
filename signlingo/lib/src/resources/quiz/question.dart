import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/element/video_youtube.dart';
import 'package:signlingo/src/bloc/quiz_bloc.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);
  @override
  State<QuestionPage> createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> {
  QuizBloc bloc = new QuizBloc();
  //dữ liệu đầu vào
  List<Map<String, bool>> answers = [
    {"way": true},
    {"what": false},
    {"want": false},
  ];
  bool check = false;
  String? selectedAnswer;
  bool isCorrect = false; //check đáp án
  @override
  Widget build(BuildContext context) {
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
                      for (var answer in answers)
                        buildAnswerButton(answer.keys.first),
                      SizedBox(
                        height: 20,
                        width: 200,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(20, 40)),
                        onPressed: () {
                          onClickButton();
                        },
                        child: Text('Check Answer'),
                      ),
                      SizedBox(height: 20),
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
                  )),
        ),
      ]),
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
          answers
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
