import 'dart:async';

import 'package:flutter/material.dart';

class LoadingFooter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoadingFooterState();
  }
}

class _LoadingFooterState extends State<LoadingFooter> {
  String loadingText = "Loading";
  void startLoadingAnimation() {
    const duration = const Duration(milliseconds: 500);

    Timer.periodic(duration, (Timer timer) {
      if (mounted) {
        setState(() {
          loadingText += '.';
          if (loadingText.length > 10) {
            loadingText = 'Loading';
          }
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startLoadingAnimation();
  }

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
                    "Loading",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {},
                ))),
          ),
        );
  }
}
