import 'package:flutter/material.dart';
import 'package:signlingo/src/header.dart';
import 'package:signlingo/src/resources/home/home.dart';

void main() {
  // runApp(const MyApp());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final pages = [
    Home(),
    Home(),
  ];
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        appBar: const Header(),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedItemColor: Colors.amber[800],
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey.shade500,
          selectedFontSize: 14.0,
          unselectedFontSize: 14.0,
          iconSize: 30.0,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  // color: Colors.black,
                ), 
                label: "Home",
                // backgroundColor: Colors.white,
      
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_outlined,
                // color: Colors.black,
                ), label: "Trainer"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined, 
                // color: Colors.black,
                ), 
                label: "Dictionary"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined, 
                // color: Colors.black,
                ), 
                label: "Settings"),
          ],
        ),
      )),
    ));
    // ));
    // ));
  }
}
