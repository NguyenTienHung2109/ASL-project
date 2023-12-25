import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({ Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String getError(String error) {
    switch (error) {
      case "channel-error": return "Please enter email and password";
      case "invalid-credential": return "You've entered an incorrect email or password";
      case "invalid-email": return "Please enter a valid email address";
    }
    return error;
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Password reset link sent! Check your email"),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      String error = getError(e.code);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
            error,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
            backgroundColor: Colors.redAccent,
          )
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
                'Enter Your Email and we will send you a password reset link',
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepOrangeAccent
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromRGBO(240, 128, 128, 1)),
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.white,
                hintText: 'Email',
                prefixIcon: Icon(Icons.email, color: Colors.deepOrangeAccent),
                filled: true,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: AssetImage(
                        "images/loginbtn.png"
                    ),
                    fit: BoxFit.cover
                )
            ),
            child: InkWell(
                onTap: passwordReset,
                child: Center(
                  child: Text(
                    "Send link",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
            ),
          ),
        ],
      )


    );
  }
}