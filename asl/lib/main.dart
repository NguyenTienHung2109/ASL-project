import 'package:flutter/material.dart';
import 'package:asl/register.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(body: MyContent()),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyContent extends StatefulWidget {
  @override
  MyContentState createState() => MyContentState();
}

class MyContentState extends State<MyContent> {
  bool showPass = false;

  TextEditingController EmailData =
      new TextEditingController(); //data cua email
  TextEditingController PassData = new TextEditingController(); //data cua pass

  String EmailError = "Email khong hop le";
  String PassError = "Pass khong le";
  bool checkEmail = false;
  bool checkPass = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IconButton(
            onPressed: () {
              print('click icon');
            },
            icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black)),
        Container(
          width: double.infinity,
          alignment: AlignmentDirectional.center,
          child: const Text(
            'Welcome back!',
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: TextField(
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
                  errorText: checkEmail ? EmailError : null,
                  labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
            )),
        Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Padding(
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
                      errorText: checkPass ? PassError : null,
                      labelStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                )),
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
                      "Creat Account",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ))
              ],
            )),
      ]),
    );
  }

  void ShowPass() {
    setState(() {
      showPass = !showPass;
    });
  }

  void onClickButton() {
    setState(() {
      if (EmailData.text.length < 6 ||
          !EmailData.text.contains("@") ||
          !EmailData.text.contains(".com")) {
        checkEmail = true;
      } else {
        checkEmail = false;
      }

      if (PassData.text.length < 6) {
        checkPass = true;
      } else {
        checkPass = false;
      }
    });
  }

  void onClickNewAcc() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }

  Widget NewAccPage(BuildContext context) {
    return Register();
  }
}
