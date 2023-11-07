import 'package:flutter/material.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() {
    // TODO: implement createState
    return HeaderState();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HeaderState extends State<Header> {
  int _point = 0;
  void getPoint(int point) {
    _point = point;
  }

  void _logo() {
    print("Click Logo");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              color: Colors.black26,
              width: 1.0,
            ))),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.orange,
              ), //Biểu tượng app
              onPressed: () {
                _logo();
              }),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.star,
                      size: 24.0,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      _logo();
                    },
                  ),
                  Text(
                    '$_point',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
