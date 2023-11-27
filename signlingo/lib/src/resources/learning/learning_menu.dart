import 'package:flutter/material.dart';

class LearningMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0.0),
      alignment: Alignment.bottomCenter,
      content: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 200.0,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 200.0,
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
                    "KEEP LESSON",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ))),
            Container(
                width: 200.0,
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
                    "EXIT LESSON",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ))),
          ],
        )),
      ),
    );
  }
}
