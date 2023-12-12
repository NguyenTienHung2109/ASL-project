import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/home/chapter/chapter_body.dart';
import 'package:signlingo/src/resources/home/chapter/chapter_header.dart';

class Chapter extends StatefulWidget {
  Chapter(
      {super.key,
      required this.chapter,
      required this.name,
      required this.description,
      required this.progress,
      required this.isLooking,
      required this.items,
      required this.unit});

  final int chapter;
  final String name;
  final String description;
  final double progress;
  final List<String> items;
  final int unit;
  bool isLooking = true;
  bool hiding = false;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    hiding = isLooking;
    return _ChapterState();
  }
}

class _ChapterState extends State<Chapter> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // height: 400.0,
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.white.withOpacity(0), // Màu viền
          width: 0.1, // Độ dày của viền
        ),
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      ),
      child: Column(children: [
        OutlinedButton(
            onPressed: () {
              setState(() {
                widget.hiding = !widget.hiding;
              });
            },
            child: ChapterHeader(
                chapter: widget.chapter,
                name: widget.name,
                description: widget.description,
                progress: widget.progress,
                isLooking: widget.isLooking)),
        // if (!widget.hiding)
        // AnimatedContainer(
        //   duration: const Duration(milliseconds: 300),
        //   curve: Curves.bounceIn,
        //   child: ChapterBody(items: widget.items),
        //   )
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: !widget.hiding
              ? ChapterBody(items: widget.items, chapter: widget.chapter, unit: widget.unit,)
              : const SizedBox.shrink(),
        ),
      ]),
    );
  }
}
