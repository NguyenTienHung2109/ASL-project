import 'package:flutter/material.dart';
import 'package:signlingo/src/bloc/Learning_bloc.dart';
import 'package:signlingo/src/database/learning_database.dart';
import 'package:signlingo/src/resources/learning/learning.dart';

import '../unit.dart';

class ChapterBodyItem extends StatefulWidget {
  final String name;
  final int unit;
  final int chapter;
  bool hasComplete;
  final Function updateProgress;
  ChapterBodyItem(
      {super.key,
      required this.name,
      required this.hasComplete,
      required this.chapter,
      required this.unit,
      required this.updateProgress});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChapterBodyItemState();
  }
}

class _ChapterBodyItemState extends State<ChapterBodyItem> {
  List<Icon> _iconList = [
  ];
  @override
  void initState() {
    super.initState();
    _iconList = [
      Icon(Icons.remove_red_eye_outlined,
          size: 45.0, color: widget.hasComplete ? Colors.orange : Colors.grey, semanticLabel: 'Discover'),
      Icon(Icons.mode_comment_outlined,
          size: 45.0, color: widget.hasComplete ? Colors.orange : Colors.grey, semanticLabel: 'Dialog'),
      Icon(Icons.rate_review_outlined,
          size: 45.0, color: widget.hasComplete ? Colors.orange : Colors.grey, semanticLabel: 'Review'),
      Icon(Icons.picture_in_picture_alt_outlined,
          size: 45.0, color: widget.hasComplete ? Colors.orange : Colors.grey, semanticLabel: 'Iconic')
    ];
  }

  Future <void> goToLearning() async {
    TwoValues result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Learning(
              unit: widget.unit,
              chapter: widget.chapter,
              name: widget.name,
            )));
    if (result.value1 == true && widget.hasComplete == false) {
      widget.hasComplete = true;
      print('hahahahahha');
      await LearningData.updateProgress(widget.unit, widget.chapter, widget.name);
      widget.updateProgress();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 80.0,
      height: 80.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                goToLearning();
              });
            },
            child: Container(
              child: _iconList[_iconList.indexWhere((element) {
                Icon icon = element;
                return icon.semanticLabel == widget.name;
              })],
              // color: widget.hasComplete? Colors.orange : Colors.grey,
            )

          ),
          Text(
            widget.name,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
