import 'package:flutter/material.dart';

class ChapterHeader extends StatefulWidget {
  final int chapter;
  final String name;
  final String description;
  final double progress;
  bool isLooking = true;

  ChapterHeader(
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

class _ChapterHeaderState extends State<ChapterHeader> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50.0,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
      color: Colors.white,
      child: Row(
        // direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: SizedBox(
              width: 250.0,
              child: Wrap(
                // runSpacing: 2.0,
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  Text(
                    "Chapter ${widget.chapter} - ${widget.name}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(color: Colors.black54),
                    // maxLines: 2,
                    // overflow: TextOverflow.clip,
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    strokeWidth: 5.0,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation(Colors.amber.shade600),
                    value: !widget.isLooking ? widget.progress / 100 : 0,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: !widget.isLooking ? const EdgeInsets.only(left: 5.0) : const EdgeInsets.only(left: 8.0),
                  child: !widget.isLooking
                      ? Text(
                          "${widget.progress.toStringAsFixed(0)}%",
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                        )
                      : const Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.black54,
                          size: 20.0,
                        ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
