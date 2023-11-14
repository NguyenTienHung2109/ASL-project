/*import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Tạo một Map ở cấp cao nhất của ứng dụng
  final Map<String, bool> answerMap = {
    'A. 1999': true,
    'B. 1998': false,
    'C. 1997': false,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Câu hỏi về năm sinh'),
        ),
        // Truyền Map vào Widget con
        body: QuestionWidget(answerMap),
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  final Map<String, bool> answerMap;

  // Khai báo một tham số tại lớp con
  QuestionWidget(this.answerMap);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Năm sinh của bạn A là?',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.answerMap.length,
          itemBuilder: (context, index) {
            var entry = widget.answerMap.entries.elementAt(index);
            return AnswerWidget(
              answerText: entry.key,
              isCorrect: entry.value,
            );
          },
        ),
      ],
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
*/