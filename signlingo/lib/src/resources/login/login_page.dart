import 'package:flutter/material.dart';
import 'package:signlingo/src/bloc/login_bloc.dart';
import 'package:signlingo/src/resources/home/home.dart';
import 'package:signlingo/src/resources/login/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  LoginBloc bloc = new LoginBloc();
  bool showPass = false;

  TextEditingController EmailData =
      new TextEditingController(); //data cua email
  TextEditingController PassData = new TextEditingController(); //data cua pass

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.arrow_back, size: 30, color: Colors.black),
          Container(
            width: double.infinity,
            alignment: AlignmentDirectional.center,
            child: const Text(
              'Welcome back!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: StreamBuilder(
                  stream: bloc.userStream,
                  builder: (context, snapshot) => TextField(
                        controller: EmailData,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                            labelText: 'Email',
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ))),
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              StreamBuilder(
                  stream: bloc.passStream,
                  builder: (context, snapshot) => Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: TextField(
                        controller: PassData,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        obscureText: !showPass,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                            labelText: 'Password',
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ))),
              IconButton(
                  onPressed: () {
                    print('click eye');
                    ShowPass();
                  },
                  icon: showPass
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.remove_red_eye_outlined))
            ],
          ),
          Container(
              alignment: AlignmentDirectional.center,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        print('click button');
                        onClickButton();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('LOGIN')),
                  TextButton(
                      onPressed: () {
                        print('button acc');
                        onClickNewAcc();
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ))
                ],
              )),
        ]),
      ),
    );
  }

  void ShowPass() {
    setState(() {
      showPass = !showPass;
    });
  }

  void onClickButton() {
    setState(() {
      if (bloc.isValidInfo(EmailData.text, PassData.text)) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
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

  Widget GotoHome(BuildContext context) {
    return Home();
  }
}
