import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/home/chapter/chapter.dart';

class Unit extends StatefulWidget {
  final int unit;
  final String description;

  const Unit({super.key, required this.unit, required this.description});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UnitState();
  }
}

class _UnitState extends State<Unit> {
  List<Widget> items = [
    Chapter(
      chapter: 1,
      name: "Hello and welcome",
      description: "Greet people and ask them how they are doing.",
      progress: 10,
      isLooking: false,
      items: const ['Discover', 'Discover', 'Discover'],
    ),
    Chapter(
      chapter: 2,
      name: "Hello and welcome",
      description: "Greet people and ask them how they are doing.",
      progress: 10,
      isLooking: false,
      items: const ['Discover', 'Discover', 'Discover'],
    ),
    Chapter(
      chapter: 3,
      name: "Hello and welcome",
      description: "Greet people and ask them how they are doing.",
      progress: 40,
      isLooking: true,
      items: const ['Discover', 'Discover', 'Discover', 'Dialog', 'Review'],
    ),
    Chapter(
      chapter: 4,
      name: "Hello and welcome",
      description: "Greet people and ask them how they are doing.",
      progress: 30,
      isLooking: true,
      items: const [
        'Discover',
        'Iconic',
        'Dialog',
        'Review'
      ],
    )
  ];

  List<Widget> getItem() {
    List<Widget> result = [];
    for (int i = 0; i < items.length; i++) {
      result.add(items[i]);
      result.add(Container(
        height: 20.0,
        color: Colors.grey.shade200,
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: double.infinity,
      color: Colors.grey.shade200,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(  
            height: 25.0,
            color: Colors.grey.shade200,
          ),
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
            child: Container(
              // height: 125,
              // width: 220,
              padding: const EdgeInsets.all(25.0),
              // margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                // color: Colors.white,
                border: Border.all(
                  color: Colors.white.withOpacity(0), // Màu viền
                  width: 0.1, // Độ dày của viền
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Center(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Unit ${widget.unit}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 10.0,
                      // color: Colors.white,
                    ),
                    Center(
                      child: Text(
                        widget.description,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 25.0,
            color: Colors.grey.shade200,
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            width: 400,
            color: Colors.grey.shade200,
            child: Column(
              children: getItem(),
            ),
          )
        ],
      ),
    );
  }
}
