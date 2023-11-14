import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}