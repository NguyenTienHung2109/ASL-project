import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/element/glowing_button.dart';
import 'package:signlingo/src/resources/login/auth_page.dart';
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
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Color(0xFF674AEF),
                    borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(70)),
                  ),
                  child: Center(child: Image.asset("images/books.png", scale: 0.8))
                )
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height / 1.6,
                  padding: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    color: Color(0xFF674AEF),
                  ),
                )
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height / 1.6,
                  padding: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                    )
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Learning Sign Language",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 60),
                      Material(
                        color: Color(0xFF674AEF),
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: onClickStartButton,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 80
                            ),
                            child: Text(
                              "Get Start",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );






  }

  void onClickStartButton() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AuthPage()));
    });
  }

  void onClickNewAcc() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AuthPage()));
    });
  }

  Widget NewAccPage(BuildContext context) {
    return AuthPage();
  }

  Widget GotoLoginPage(BuildContext context) {
    return AuthPage();
  }
}
