import 'package:asl/src/resources/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(body: MyApp()),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
