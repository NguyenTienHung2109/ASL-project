import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FooterState();
  }
}

class _FooterState extends State<Footer> {
  String selectedButton = "Home";
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
              color: Colors.black26,
              width: 1.0,
            ))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 1.5, 0, 2.5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Element(
                  name: "Home",
                  isSelected: selectedButton == "Home",
                  onSelected: (name) {
                    setState(() {
                      selectedButton = name;
                    });
                  }),
              _Element(
                  name: "Trainer",
                  isSelected: selectedButton == "Trainer",
                  onSelected: (name) {
                    setState(() {
                      selectedButton = name;
                    });
                  }),
              _Element(
                  name: "Dictionary",
                  isSelected: selectedButton == "Dictionary",
                  onSelected: (name) {
                    setState(() {
                      selectedButton = name;
                    });
                  }),
              _Element(
                  name: "Settings",
                  isSelected: selectedButton == "Settings",
                  onSelected: (name) {
                    setState(() {
                      selectedButton = name;
                    });
                  }),
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class _Element extends StatefulWidget {
  final String name;
  late bool isSelected;
  final Function(String) onSelected;

  _Element(
      {required this.name, required this.isSelected, required this.onSelected});

  @override
  State<StatefulWidget> createState() {
    return _ElementState();
  }
}

class _ElementState extends State<_Element> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      Icon(Icons.home_outlined, // Home
          size: 40.0,
          color: widget.isSelected ? Colors.orange : Colors.black54,
          semanticLabel: 'Home'),
      Icon(Icons.menu_book_outlined, // Trainer
          size: 40.0,
          color: widget.isSelected ? Colors.orange : Colors.black54,
          semanticLabel: 'Trainer'),
      Icon(Icons.list_alt_outlined, // Dictionary
          size: 40.0,
          color: widget.isSelected ? Colors.orange : Colors.black54,
          semanticLabel: 'Dictionary'),
      Icon(Icons.settings_outlined, // Settings
          size: 40.0,
          color: widget.isSelected ? Colors.orange : Colors.black54,
          semanticLabel: 'Settings')
    ];

    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget.onSelected(widget.name);
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        side: BorderSide.none,
        elevation: 0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widgetList[widgetList.indexWhere((element) {
            Icon icon = element as Icon;
            return icon.semanticLabel == widget.name;
          })],
          Text(
            widget.name,
            style: TextStyle(
              fontSize: 12.0,
              color: widget.isSelected ? Colors.orange : Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}
