import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Radio Buttons Demo'),
        ),
        body: MyRadioButtons(),
      ),
    );
  }
}

class MyRadioButtons extends StatefulWidget {
  @override
  _MyRadioButtonsState createState() => _MyRadioButtonsState();
}

class _MyRadioButtonsState extends State<MyRadioButtons> {
  String selectedOption = 'Option 1'; // Giá trị mặc định

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: Text('Option 1'),
          leading: Radio(
            value: 'Option 1',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Option 2'),
          leading: Radio(
            value: 'Option 2',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value as String;
              });
            },
          ),
        ),
      ],
    );
  }
}
