import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/element/glowing_button.dart';
import 'package:signlingo/src/resources/login/login_page.dart';
import 'package:signlingo/src/resources/login/register_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text(
                "Start learning a",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                "Sign Language",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Column(
            children: [
          ElevatedButton(
            onPressed: () {
                  print("start button");
                  onClickStartButton();
                  },
            style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    minimumSize: Size(160, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
            child: GlowingButton(
              color1: Colors.redAccent,
              color2: Colors.yellowAccent,
              width_button: 300,
              text_button: "GET STARTED",
              event_button: onClickStartButton
            ),
          ),
          SizedBox(
            height: 10
          ),
          ElevatedButton(
            onPressed: () {
                  print("new acc button");
                  onClickNewAcc();
                  },
            style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    minimumSize: Size(160, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
            child: GlowingButton(
              color1: Colors.redAccent,
              color2: Colors.yellowAccent,
              width_button: 300,
              text_button: "I ALREADY HAVE AN ACCOUNT",
              event_button: onClickNewAcc
            ),
          ),
            ],
          ),
        ],
      ),
    ));
  }

  void onClickStartButton() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  void onClickNewAcc() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterPage()));
    });
  }

  Widget NewAccPage(BuildContext context) {
    return RegisterPage();
  }

  Widget GotoLoginPage(BuildContext context) {
    return LoginPage();
  }
}