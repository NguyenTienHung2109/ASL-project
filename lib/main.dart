import 'package:flutter/material.dart';
import 'package:mobile_project/Dictionary/dictionary.dart';
import 'package:mobile_project/footer.dart';
import 'package:mobile_project/header.dart';
//import 'package:mobile_project/home.dart';


void main() {
  // runApp(const MyApp());
  runApp(const MaterialApp(
    home: SafeArea(
        child: Scaffold(
          appBar: Header(),
          body: Dictionary(),
          bottomNavigationBar: Footer(),
        )
    ),
    debugShowCheckedModeBanner: false,
  ));
}
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Search Box Example'),
//         ),
//         body: Dictionary(),
//       ),
//     );
//   }
// }



