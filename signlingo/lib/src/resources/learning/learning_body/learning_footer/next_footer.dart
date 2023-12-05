import 'package:flutter/material.dart';

class NextFooter extends StatelessWidget {
  late Function nextLesson;

  NextFooter({super.key, required this.nextLesson});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
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
            margin: const EdgeInsets.only(bottom: 20),
            child: Center(
                child: TextButton(
              child: const Text(
                "NEXT",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                nextLesson();
              },
            ))),
      ),
    );
  }
}
