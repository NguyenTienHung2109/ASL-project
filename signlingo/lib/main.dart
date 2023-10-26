import 'package:flutter/material.dart';
import 'package:signlingo/footer.dart';
import 'package:signlingo/header.dart';
import 'package:signlingo/home/home.dart';


void main() {
  // runApp(const MyApp());
  runApp(const MaterialApp(
    home: SafeArea(
        child: Scaffold(
      appBar: Header(),
      body: Home(),
      bottomNavigationBar: Footer(),
    )),
    debugShowCheckedModeBanner: false,
  ));
}



