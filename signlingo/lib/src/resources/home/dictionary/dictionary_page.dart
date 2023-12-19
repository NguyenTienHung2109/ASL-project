import 'package:flutter/material.dart';
import 'package:signlingo/src/database/dict_database.dart';
import 'package:signlingo/src/repository/video_youtube.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DictionaryPageState();
  }
}

class _DictionaryPageState extends State<DictionaryPage> {
  String activeButton = '';
  String selectedLetter = '';

  final TextEditingController _textController = TextEditingController();

  bool isTextNotEmpty = false;

  Map<String, dynamic> _letterData = {};
  List<String> allKeys = [];
  List<String> filteredKeys = [];

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        isTextNotEmpty = _textController.text.isNotEmpty;
        filterKeys();
      });
    });
    fetchData();
  }

  Future<void> fetchData() async {
    Map<String, dynamic> allData = {};
    List<String> keys = [];

    for (int i = 0; i < 26; i++) {
      String letter = String.fromCharCode('A'.codeUnitAt(0) + i);
      Map<String, dynamic> data = await DictData.getLetter(letter);
      allData[letter] = data;
      keys.addAll(data.keys);
    }

    setState(() {
      _letterData = allData;
      allKeys = keys;
      filteredKeys = allKeys;
    });
  }

  void filterKeys() {
    if (isTextNotEmpty) {
      filteredKeys = allKeys
          .where((key) =>
              key.toLowerCase().contains(_textController.text.toLowerCase()))
          .toList();
      selectedLetter = '';
    } else if (selectedLetter.isNotEmpty) {
      filteredKeys = allKeys
          .where((key) =>
              key.toLowerCase().startsWith(selectedLetter.toLowerCase()))
          .toList();
    } else {
      filteredKeys = allKeys;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
                top: 25.0, right: 10.0, left: 10.0, bottom: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                color: Colors.orange,
                width: 2.5,
              ),
              color: Colors.white,
            ),
            child: TextField(
              controller: _textController,
              cursorColor: Colors.orange,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for a word',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.orange,
                suffixIcon: isTextNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear, color: Colors.orange),
                        onPressed: () {
                          setState(() {
                            _textController.clear();
                          });
                        },
                      )
                    : null,
              ),
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.all(10.0),
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(26, (index) {
                final char = String.fromCharCode('A'.codeUnitAt(0) + index);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (activeButton == char) {
                            activeButton = '';
                            selectedLetter = '';
                          } else {
                            activeButton = char;
                            selectedLetter = char;
                          }
                          filterKeys();
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: (activeButton == char &&
                                !isTextNotEmpty)
                            ? MaterialStatePropertyAll(Colors.orange.shade300)
                            : MaterialStatePropertyAll(Colors.yellow.shade50),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            side: const BorderSide(
                                color: Colors.grey, width: 0.5),
                          ),
                        ),
                        elevation: MaterialStatePropertyAll(4.0),
                      ),
                      child: Container(
                        child: Text(
                          char,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredKeys.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(400, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      elevation: MaterialStatePropertyAll(4.0),
                      backgroundColor: MaterialStatePropertyAll(Colors.orange),
                    ),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                              height: 400,
                              // width: double.infinity,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(filteredKeys[index].toUpperCase(),
                                      style: TextStyle(fontSize: 35)),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                                    // width: double.infinity,
                                    // height: double.infinity,
                                    child: VideoYoutube(filteredKeys[index]),
                                  )
                                ],
                              ));
                        },
                      );
                    },
                    child: Text(filteredKeys[index].toUpperCase(),
                        style: TextStyle(fontSize: 18)),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
