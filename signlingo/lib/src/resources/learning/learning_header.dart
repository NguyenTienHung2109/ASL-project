import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LearningHeader extends StatefulWidget {
  late Function menuHiding;
  late int complete;
  late int total;

  LearningHeader(
      {super.key,
      required this.menuHiding,
      required this.complete,
      required this.total});
  void increment() {
    complete++;
    if (complete > total) complete = total;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LearningHeaderState();
  }
}

class _LearningHeaderState extends State<LearningHeader> {
  void update() {
    setState(() {
      widget.increment();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () => {
            setState(
              () => widget.menuHiding(),
            )
          },
        ),
        actions: [],
      ),
    );
  }
}
