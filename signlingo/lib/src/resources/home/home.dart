import 'package:flutter/material.dart';
import 'package:signlingo/src/header.dart';
import 'package:signlingo/src/resources/home/dictionary/dictionary_page.dart';
import 'package:signlingo/src/resources/home/home_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final pages = [
    HomePage(),
    HomePage(),
    DictionaryPage() // Trainer
    // Dictionary
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Container(
        // color: Colors.red,
        child: pages[currentIndex],
      )
      ,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          // color: Colors.red,
          border: Border(top: BorderSide(width: 0.5, color: Colors.black26))
        ),
        child: BottomNavigationBar(
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
              icon: Icon(
                Icons.menu_book_outlined,
                // color: Colors.black,
              ),
              label: "Trainer"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt_outlined,
                // color: Colors.black,
              ),
              label: "Dictionary"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
                // color: Colors.black,
              ),
              label: "Settings"),
        ],
      )),
    );
    // ));
    // ));
  }
}
