import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/home/unit.dart';

class HomePage extends StatefulWidget {
  late String username;
  HomePage({super.key, required this.username});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // height: double.infinity,
      color: Colors.grey.shade300,
      child: Unit(unit: 1, description: "Introduction"),
    );
  }
}
