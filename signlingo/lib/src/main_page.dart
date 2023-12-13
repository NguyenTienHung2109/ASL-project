import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/home/home.dart';
import 'package:signlingo/src/resources/home/home_page.dart';
import 'package:signlingo/src/resources/login/auth_page.dart';
import 'package:signlingo/src/resources/login/login_page.dart';
import 'package:signlingo/src/resources/login/register_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}