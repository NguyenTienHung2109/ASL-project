import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage> {
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();


  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String getError(String error) {
    switch (error) {
      case "channel-error": return "Please complete your information";
      case "invalid-credential": return "You've entered an incorrect email or password";
      case "invalid-email": return "Please enter a valid email address";
    }
    return error;
  }

  Future signUp() async {
    try {
      if (passwordConfirm()) {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        FirebaseFirestore.instance
            .collection('user_info')
            .doc(userCredential.user!.email)
            .set({
          'email' :_emailController.text.trim(),
          'password' : _passwordController.text.trim(),
          'fullname' : _fullnameController.text.trim()
        });
        //addUserDetails(_fullnameController.text.trim(), _emailController.text.trim(), _passwordController.text.trim());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Confirm password must be the same as the password",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.redAccent,
            )
        );
      }
    } on FirebaseAuthException catch (e){
      String error = getError(e.code);
      print(e.code);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
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

  // Future addUserDetails(String fullname, String email, String password) async {
  //   await FirebaseFirestore.instance.collection('user_info').add({
  //     'fullname': fullname,
  //   });
  // }

  bool passwordConfirm() {
    if (_passwordController.text.trim() == _confirmPasswordController.text.trim()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
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
                      "Join with us",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Register below with your details!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(240, 128, 128, 1),
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                      child: TextField(
                        controller: _fullnameController,
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
                          hintText: 'Fullname',
                          prefixIcon: Icon(Icons.person, color: Colors.deepOrangeAccent),
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(height:10),
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
                    SizedBox(height:10),
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
                    SizedBox(height: 10),
                    Container(
                      child: TextField(
                        controller: _confirmPasswordController,
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
                          hintText: 'Confirm Password',
                          prefixIcon: Icon(Icons.password_outlined, color: Colors.deepOrangeAccent),
                          filled: true,
                        ),
                        obscureText: true,
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
                    onTap: signUp,
                    child: Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I am a member! ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      "Login Now!",
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
      ),
    );
  }
}