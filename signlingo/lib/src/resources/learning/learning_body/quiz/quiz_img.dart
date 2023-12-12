import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/learning/learning_body/quiz/img_question.dart';
import 'package:signlingo/src/resources/element/video_youtube.dart';

class QuizImg extends StatefulWidget {
  late Function nextLesson;
  QuizImg({Key? key, required this.nextLesson}) : super(key: key);

  @override
  QuizImgState createState() => QuizImgState();
}

class QuizImgState extends State<QuizImg> {
  //dữ liệu đầu vào
  List<Map<String, bool>> answers = [
    {"way": true},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image(
                      height: 100,
                      image: NetworkImage(
                          'https://lh3.googleusercontent.com/l1PbMRIFRS4BcOXSyUjbSsi3OKJOdp6ysy0G5w2O-jNCHcRMnWRDXSWNee0MHifq9IMVqLxo23K3A0iMh8UutYMjOUpwyrsxnS-VpO7S=rp-w1080-nu'),
                      fit: BoxFit.cover,
                    ),
                    ElevatedButton(onPressed: () => (),style: ElevatedButton.styleFrom(), child: Text("A"),
                    )
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Image(
                      height: 100,
                      image: NetworkImage(
                          'https://i.pinimg.com/564x/38/06/27/380627e32b6929506158183ca94b7b31.jpg'),
                      fit: BoxFit.cover,
                    ),
                    ElevatedButton(onPressed: () => (), child: Text("B"))
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: QuestionPage(
            answers: answers,
            nextLesson: widget.nextLesson,
          )),
        ]),
      ),
    );
  }
}
