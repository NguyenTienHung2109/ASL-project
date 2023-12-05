import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/learning/learning.dart';

class ChapterBodyItem extends StatefulWidget {
  final String name;
  bool hasComplete;
  ChapterBodyItem({super.key, required this.name, required this.hasComplete});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChapterBodyItemState();
  }
}

class _ChapterBodyItemState extends State<ChapterBodyItem> {
  static final List<Icon> _iconList = [
    const Icon(Icons.remove_red_eye_outlined,
        size: 45.0, color: Colors.orange, semanticLabel: 'Discover'),
    const Icon(Icons.mode_comment_outlined,
        size: 45.0, color: Colors.orange, semanticLabel: 'Dialog'),
    const Icon(Icons.rate_review_outlined,
        size: 45.0, color: Colors.orange, semanticLabel: 'Review'),
    const Icon(Icons.picture_in_picture_alt_outlined,
        size: 45.0, color: Colors.orange, semanticLabel: 'Iconic')
  ];
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Learning(
                              total: 10,
                            )));
              });
            },
            child: _iconList[_iconList.indexWhere((element) {
              Icon icon = element;
              return icon.semanticLabel == widget.name;
            })],
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
