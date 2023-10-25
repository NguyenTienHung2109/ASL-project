import 'package:flutter/material.dart';
import 'package:signlingo/footer.dart';
import 'package:signlingo/header.dart';


void main() {
  // runApp(const MyApp());
  runApp(const MaterialApp(
    home: SafeArea(
        child: Scaffold(
      appBar: Header(),
      body: Center(child: Text(
        "check",
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        )),
      bottomNavigationBar: Footer(),
      // bottomSheet: Footer(),
    )),
    debugShowCheckedModeBanner: false,
  ));
}



