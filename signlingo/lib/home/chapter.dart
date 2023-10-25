import 'package:flutter/material.dart';

class Chapter extends StatefulWidget {
  Chapter(
      {super.key,
      required this.chapter,
      required this.name,
      required this.description,
      required this.progress,
      required this.isLooking});

  final int chapter;
  final String name;
  final String description;
  final double progress;
  bool isLooking = true;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChapterState();
  }
}

class _ChapterState extends State<Chapter> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(children: [
        _ChapterHeader(
            chapter: widget.chapter,
            name: widget.name,
            description: widget.description,
            progress: widget.progress,
            isLooking: widget.isLooking)
      ]),
    );
  }
}

class _ChapterHeader extends StatefulWidget {
  final int chapter;
  final String name;
  final String description;
  final double progress;
  bool isLooking = true;

  _ChapterHeader(
      {required this.chapter,
      required this.name,
      required this.description,
      required this.progress,
      required this.isLooking});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChapterHeaderState();
  }
}

class _ChapterHeaderState extends State<_ChapterHeader> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 51.0,
      color: Colors.white,
      child: Padding(   
        padding: const EdgeInsets.only(top: 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 9,
                child: SizedBox(
                  width: 250.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chapter ${widget.chapter} - ${widget.name}",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        widget.description,
                        style: const TextStyle(color: Colors.black54),
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      )
                    ],
                  ),
                )),
            Flexible(
                flex: 1,
                child: Stack(
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5.0,
                        backgroundColor: Colors.black26,
                        valueColor:
                            AlwaysStoppedAnimation(Colors.amber.shade600),
                        value: widget.progress,
                      ),
                    ),
                    Center(
                      child: Text(
                        "${widget.progress.toStringAsFixed(0)}%",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}