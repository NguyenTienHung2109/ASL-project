import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/element/video_youtube.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  @override
  State<QuizPage> createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  final Map<String, bool> answerMap = {
    'A. 1999': true,
    'B. 1998': false,
    'C. 1997': false,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        Column(
          children: [
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
        ListView.builder(
          shrinkWrap: true,
          itemCount: answerMap.length,
          itemBuilder: (context, index) {
            var entry = answerMap.entries.elementAt(index);
            return AnswerWidget(
              answerText: entry.key,
              isCorrect: entry.value,
            );
          },
        ),
          ],
        )
        
    );
  }
}

class AnswerWidget extends StatelessWidget {
  final String answerText;
  final bool isCorrect;

  AnswerWidget({required this.answerText, required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(answerText),
      tileColor: isCorrect ? Colors.green : Colors.red,
    );
  }
}
