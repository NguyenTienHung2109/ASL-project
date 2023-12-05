import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/next_footer.dart';

class StudyPage extends StatefulWidget {
  late String name;
  late Function nextLesson;

  StudyPage({super.key, required this.name, required this.nextLesson});
  bool isComplete() {
    return true;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudyPageState();
  }
}

class _StudyPageState extends State<StudyPage> {
  @override
  Widget build(Object context) {
    // TODO: implement build
    return Scaffold(
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
                  height: 30,
                  color: Colors.white,
                  child: Text(
                    "Learn a new sign!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  height: 7.5,
                  color: Colors.white,
                ),
                // Video
                Center(
                    child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey.shade300,
                    ),
                    // borderRadius: BorderRadius.circular(20)
                  ),
                )),
                Container(
                  height: 20,
                  color: Colors.white,
                ),
                // Word
                Center(
                    child: Container(
                  // width: 400,
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 2,
                        color: Colors.amber.shade200,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    widget.name,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                    ),
                  )),
                )),
              ])),
      bottomNavigationBar: NextFooter(nextLesson: () {
        widget.nextLesson();
      }),
    );
  }
}
