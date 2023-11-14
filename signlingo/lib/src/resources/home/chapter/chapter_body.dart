import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/home/chapter/chapter_item.dart';

class ChapterBody extends StatefulWidget {
  final List<String> items;

  const ChapterBody({super.key, required this.items});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChapterBodyState();
  }
}

class _ChapterBodyState extends State<ChapterBody> {
  List<Widget> createWrapWithSpace(List<String> itemList) {
    List<Widget> childrenWithSpace = [];

    for (int i = 0; i < itemList.length; i++) {
      if (i != 0) {
        // Thêm dấu cách giữa các phần tử, ví dụ dấu phẩy và khoảng trắng
        childrenWithSpace.add(
          Container(
              width: 15.0,
              height: 80.0,
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
              alignment: Alignment.center,
              child: const Text(
                ">",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 20.0,
                ),
              )),
        );
      }
      childrenWithSpace
          .add(ChapterBodyItem(name: itemList[i], hasComplete: false));
    }
    return childrenWithSpace;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Container(
            height: 4,
            width: double.infinity,
            color: Colors.grey.shade200,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 15.0),
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: createWrapWithSpace(widget.items),
            ),
          )
        ],
      ),
    );
  }
}
