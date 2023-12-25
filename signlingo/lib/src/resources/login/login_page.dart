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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: w,
                  height: h*0.6,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "images/loginimg.png"
                          ),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Container(
                  width: w,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "Sign into your account",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(240, 128, 128, 1),
                        ),
                      ),
                      SizedBox(height:20),
                      Container(
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
                      SizedBox(height:20),
                      Container(
                        child: TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color.fromRGBO(240, 128, 128, 1)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.white,
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.password_outlined, color: Colors.deepOrangeAccent),
                            filled: true,
                          ),
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  width: w*0.6,
                  height: h*0.15,
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
                      onTap: signIn,
                      child: Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                  ),
                ),
                SizedBox(height: h*0.25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        "Register Now!",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

      )




      // body: SafeArea(
      //   child: Center(
      //     child: SingleChildScrollView(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           const Icon(
      //             Icons.android,
      //             size: 100,
      //           ),
      //           const SizedBox(height: 25),
      //           Text(
      //               'Hello Again',
      //               style: GoogleFonts.bebasNeue(
      //                 fontSize: 52,
      //               )
      //           ),
      //           const SizedBox(height: 10),
      //           const Text(
      //             'Welcome back, you\'ve been missed!',
      //             style: TextStyle(
      //               fontSize: 20,
      //             ),
      //           ),
      //           const SizedBox(height: 50),
      //
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //             child: TextField(
      //               controller: _emailController,
      //               decoration: InputDecoration(
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide: const BorderSide(color: Colors.white),
      //                   borderRadius: BorderRadius.circular(12),
      //                 ),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: const BorderSide(color: Colors.deepPurple),
      //                   borderRadius: BorderRadius.circular(12),
      //                 ),
      //                 fillColor: Colors.grey[200],
      //                 hintText: 'Email',
      //                 filled: true,
      //               ),
      //             ),
      //           ),
      //
      //
      //           const SizedBox(height: 10),
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //             child: TextField(
      //               controller: _passwordController,
      //               decoration: InputDecoration(
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide: const BorderSide(color: Colors.white),
      //                   borderRadius: BorderRadius.circular(12),
      //                 ),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: const BorderSide(color: Colors.deepPurple),
      //                   borderRadius: BorderRadius.circular(12),
      //                 ),
      //                 fillColor: Colors.grey[200],
      //                 hintText: 'Password',
      //                 filled: true,
      //               ),
      //               obscureText: true,
      //             ),
      //           ),
      //
      //           Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.end,
      //                 children: [
      //                   GestureDetector(
      //                     onTap: () {
      //                       Navigator.push(
      //                           context,
      //                         MaterialPageRoute(
      //                             builder: (context) {
      //                               return ForgotPasswordPage();
      //                             }
      //                         )
      //                       );
      //                     },
      //                     child: Text(
      //                       "Forgot Password?",
      //                       style: TextStyle(
      //                         color: Colors.blue,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   )
      //                 ],
      //               ),
      //
      //           ),
      //
      //
      //           Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 25),
      //               child: GestureDetector(
      //                 onTap: signIn,
      //                 child: Container(
      //                   padding: const EdgeInsets.all(20),
      //                   decoration: BoxDecoration(
      //                     color: Colors.deepPurple,
      //                     borderRadius: BorderRadius.circular(12),
      //                   ),
      //                   child: const Center(
      //                     child: Text(
      //                       'Sign In',
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 18,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               )
      //
      //           ),
      //           const SizedBox(height: 25),
      //
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Text(
      //                 "Not a member? ",
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //               GestureDetector(
      //                 onTap: widget.showRegisterPage,
      //                 child: Text(
      //                   "Register Now!",
      //                   style: TextStyle(
      //                     color: Colors.blue,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
