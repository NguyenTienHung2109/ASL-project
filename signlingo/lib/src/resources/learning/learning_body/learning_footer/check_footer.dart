import 'package:flutter/material.dart';

class CheckFooter extends StatefulWidget {
  late Future<void> Function() checkLesson;

  CheckFooter({super.key, required this.checkLesson});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CheckFooterState();
  }
}

class _CheckFooterState extends State<CheckFooter> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
          decoration: BoxDecoration(color: Colors.white),
          height: 100,
          child: Center(
            child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange[300]!, Colors.orange[800]!],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  color: Colors.amber.shade900,
                  border: Border.all(
                    width: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                margin: EdgeInsets.only(bottom: 20),
                child: Center(
                    child: TextButton(
                  child: const Text(
                    "CHECK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    widget.checkLesson();
                  },
                ))),
          ),
        );
  }
}
