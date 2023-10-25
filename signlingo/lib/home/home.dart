import 'package:flutter/material.dart';
import 'package:signlingo/home/unit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // height: double.infinity,
      color: Colors.grey.shade300,
      child: Unit(unit: 1),
    );
  }
}
