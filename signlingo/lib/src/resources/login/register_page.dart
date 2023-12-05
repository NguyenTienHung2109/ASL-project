import 'package:flutter/material.dart';
import 'package:signlingo/src/bloc/login_bloc.dart';
import 'package:signlingo/src/resources/home/home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  //const RegisterPage({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<RegisterPage> {
  LoginBloc bloc = LoginBloc();

  bool showPass = false;
  bool showPass2 = false;

  TextEditingController EmailData =
      TextEditingController(); //data cua email
  TextEditingController PassData = TextEditingController(); //data cua pass
  TextEditingController Pass2Data =
      TextEditingController(); //kiem tra lai pass
  TextEditingController NameData = TextEditingController(); //data cua name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Register")),
        body: Container(
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              alignment: AlignmentDirectional.center,
              child: const Text(
                'Sign up for free!',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: StreamBuilder(
                    stream: bloc.userStream,
                    builder: (context, snapshot) => TextField(
                          controller: EmailData,
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                              labelText: 'Email',
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ))),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: TextField(
                  controller: NameData,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      labelText: 'First Name',
                      labelStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                )),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                StreamBuilder(
                    stream: bloc.passStream,
                    builder: (context, snapshot) => Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextField(
                          controller: PassData,
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                          obscureText: !showPass,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                              labelText: 'Password',
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: const TextStyle(
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
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.remove_red_eye_outlined))
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                StreamBuilder(
                    stream: bloc.passStream2,
                    builder: (context, snapshot) => Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextField(
                          controller: Pass2Data,
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                          obscureText: !showPass2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                              labelText: 'Check your password again',
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ))),
                IconButton(
                    onPressed: () {
                      print('click eye2');
                      ShowPass2();
                    },
                    icon: showPass
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.remove_red_eye_outlined))
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
                        child: const Text('CREATE ACCOUNT')),
                    TextButton(
                        onPressed: () {
                          print('button acc');
                          onClickNewAcc();
                        },
                        child: const Text(
                          "I already have an account",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ))
                  ],
                )),
          ]),
        ));
  }

  void ShowPass() {
    setState(() {
      showPass = !showPass;
    });
  }

  void ShowPass2() {
    setState(() {
      showPass2 = !showPass2;
    });
  }

  void onClickButton() {
    setState(() {
      if (bloc.isValidNewInfo(EmailData.text, PassData.text, Pass2Data.text)) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    });
  }

  void onClickNewAcc() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  Widget NewAccPage(BuildContext context) {
    return Home();
  }
}