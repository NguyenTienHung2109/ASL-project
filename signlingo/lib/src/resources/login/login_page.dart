import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signlingo/src/bloc/login_bloc.dart';
import 'package:signlingo/src/resources/start/start_page.dart';

import 'forgot_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc = LoginBloc();
  bool showPass = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String getError(String error) {
      switch (error) {
        case "channel-error": return "Please enter email and password";
        case "invalid-credential": return "You've entered an incorrect email or password";
        case "invalid-email": return "Please enter a valid email address";
    }
    return error;
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text(
      //      "Login successful",
      //       style: TextStyle(
      //         color: Colors.white,
      //       ),
      //     ),
      //       backgroundColor: Colors.green,
      //     )
      // );
    } on FirebaseAuthException catch (e) {
      String error = getError(e.code);
      print(e.code);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
          error,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
          backgroundColor: Colors.redAccent,
          )
        );
    }

  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.android,
                  size: 100,
                ),
                const SizedBox(height: 25),
                Text(
                    'Hello Again',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                    )
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fillColor: Colors.grey[200],
                      hintText: 'Email',
                      filled: true,
                    ),
                  ),
                ),


                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fillColor: Colors.grey[200],
                      hintText: 'Password',
                      filled: true,
                    ),
                    obscureText: true,
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                              MaterialPageRoute(
                                  builder: (context) {
                                    return ForgotPasswordPage();
                                  }
                              )
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),

                ),


                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    )

                ),
                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member? ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        "Register Now!",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void ShowPass() {
  //   setState(() {
  //     showPass = !showPass;
  //   });
  // }
  //
  // void onClickButton() {
  //   setState(() {
  //     if (bloc.isValidInfo(EmailData.text, PassData.text)) {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Home()));
  //     }
  //   });
  // }
  //
  // void onClickNewAcc() {
  //   setState(() {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => RegisterPage()));
  //   });
  // }
  //
  // Widget NewAccPage(BuildContext context) {
  //   return RegisterPage();
  // }
  //
  // Widget GotoHome(BuildContext context) {
  //   return Home();
  // }
}
