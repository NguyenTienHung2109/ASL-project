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
        'Discover',
        'Discover',
        'Discover',
        'Discover',
        'Discover',
        'Dialog',
        'Review'
      ],
    )
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white.withOpacity(0), // Màu viền
              width: 0.1, // Độ dày của viền
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Unit ${widget.unit}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                height: 10.0,
                color: Colors.white,
              ),
              Center(
                child: Text(
                  widget.description,
                  style: const TextStyle(color: Colors.black54, fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 25.0,
          color: Colors.black.withOpacity(0),
        ),
        ListView.separated(
          padding: const EdgeInsets.all(10.0),
          itemCount: items.length,
          itemBuilder: (BuildContext context, index) {
            return items[index];
          },
          separatorBuilder: (BuildContext context, int index) => Container(
            height: 20.0,
            color: Colors.grey.shade300,
          ),
        )
      ],
    );
    //   )
    // Container(
    //   // height: 500.0,
    //   width: double.infinity,
    //   padding: EdgeInsets.zero,
    //   margin: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
    //   child: ListView(
    //       padding: EdgeInsets.zero,
    //       // margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
    //       children: items),
    // );
  }
}
