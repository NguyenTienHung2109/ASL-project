import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Register")), body: MyContent());
  }
}

class MyContent extends StatefulWidget {
  @override
  MyContentState createState() => MyContentState();
}

class MyContentState extends State<MyContent> {
  bool showPass = false;
  bool showPass2 = false;

  TextEditingController EmailData =
      new TextEditingController(); //data cua email
  TextEditingController PassData = new TextEditingController(); //data cua pass
  TextEditingController Pass2Data =
      new TextEditingController(); //kiem tra lai pass
  TextEditingController NameData = new TextEditingController(); //data cua name

  String EmailError = "Email error";
  String PassError = "Password error";
  String Pass2Error = "Password error";
  String NameError = "Name error";
  bool checkEmail = false;
  bool checkPass = false;
  bool checkPass2 = false;
  bool checkName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: double.infinity,
          alignment: AlignmentDirectional.center,
          child: const Text(
            'Sign up for free!',
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
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
        Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: TextField(
              controller: NameData,
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  labelText: 'First Name',
                  errorText: checkName ? NameError : null,
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
        Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: TextField(
                  controller: Pass2Data,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  obscureText: !showPass2,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      labelText: 'Check your password again',
                      errorText: checkPass2 ? Pass2Error : null,
                      labelStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                )),
            IconButton(
                onPressed: () {
                  print('click eye2');
                  ShowPass2();
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
                    child: const Text('CREATE ACCOUNT')),
                TextButton(
                    onPressed: () {
                      print('button acc');
                      onClickNewAcc();
                    },
                    child: Text(
                      "I already have an account",
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

  void ShowPass2() {
    setState(() {
      showPass2 = !showPass2;
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

      if (NameData.text.length <= 0) {
        checkName = true;
      } else {
        checkName = false;
      }

      if (PassData.text.length < 6) {
        checkPass = true;
      } else {
        checkPass = false;
      }

      if (PassData.text == Pass2Data.text) {
        checkPass2 = false;
      } else {
        checkPass2 = true;
      }
    });
  }

  void onClickNewAcc() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  Widget NewAccPage(BuildContext context) {
    return RegisterPage();
  }
}
