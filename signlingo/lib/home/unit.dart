import 'package:flutter/material.dart';
import 'package:signlingo/home/chapter.dart';

class Unit extends StatefulWidget {
  final int unit;

  const Unit({super.key, required this.unit});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UnitState();
  }
}

class _UnitState extends State<Unit> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100.0,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
              side: const BorderSide(width: 1, color: Colors.white))),
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Container(
        margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
        child: Chapter(
          chapter: 1,
          name: "Hello and welcome",
          description: "Greet people and ask them how they are doing.",
          progress: 10,
          isLooking: false),
      ) ,
    );
  }
}
