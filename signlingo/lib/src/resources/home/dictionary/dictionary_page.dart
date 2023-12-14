import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signlingo/src/database/dict_database.dart';
import 'package:signlingo/src/resources/home/dictionary/videodatamodel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:convert';

class DictionaryPage extends StatefulWidget {
  late String username;
  DictionaryPage({super.key, required this.username});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DictionaryPageState();
  }
}

class _DictionaryPageState extends State<DictionaryPage> {
  String activeButton = '';

  final TextEditingController _textController = TextEditingController();

  bool isTextNotEmpty = false;

  Map<String, dynamic> _letterData = {};
  List<String> filteredKeys = [];
  Set<String> filteredKeysSet = {};

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
    for (int i = 0; i < 26; i++) {
      String letter = String.fromCharCode('A'.codeUnitAt(0) + i);
      Map<String, dynamic> data = await DictData.getLetter(letter);
      allData[letter] = data;
    }
    setState(() {
      _letterData = allData;
      filterKeys();
    });
  }

  void filterKeys() {
    filteredKeysSet.clear();
    if (isTextNotEmpty) {
      for (String letter in _letterData.keys) {
        List<String> keys = _letterData[letter].keys.toList();
        for (String key in keys) {
          if (key.toLowerCase().contains(_textController.text.toLowerCase())) {
            filteredKeysSet.add(key);
          }
        }
      }
    }
    setState(() {
      filteredKeys = List<String>.from(filteredKeysSet);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
                top: 25.0, right: 10.0, left: 10.0, bottom: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0), // Bo tròn viền
              border: Border.all(
                color: Colors.orange, // Màu của đường viền
                width: 2.5, // Độ rộng của đường viền
              ),
              color: Colors.white, // Màu nền
            ),
            child: TextField(
              controller: _textController,
              cursorColor: Colors.orange,
              decoration: InputDecoration(
                border: InputBorder.none, // Ẩn viền của TextField
                hintText: 'Search for a word',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.orange,
                suffixIcon: isTextNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.orange,
                        ),
                        onPressed: () {
                          setState(() {
                            _textController.clear();
                          });
                        },
                      )
                    : null,
              ),
              style: const TextStyle(
                fontSize:
                    18.0, // Đặt kích thước văn bản cho text trong TextField
              ),
            ),
          ),
          Container(
              height: 50,
              margin: const EdgeInsets.all(10.0),
              // padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0, 5.0),
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(26, (index) {
                  final char = String.fromCharCode('A'.codeUnitAt(0) + index);
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0), // Thêm khoảng cách giữa các button
                      child: SizedBox(
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              activeButton = char;
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: activeButton == char
                                  ? MaterialStatePropertyAll(
                                      Colors.orange.shade300)
                                  : MaterialStatePropertyAll(
                                      Colors.yellow.shade50),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  side: const BorderSide(
                                      color: Colors.grey, width: 0.5),
                                ),
                              ),
                              elevation: MaterialStatePropertyAll(4.0)
                              // Màu đổ bóng
                              ),
                          child: Container(
                            child: Text(
                              char,
                              style: const TextStyle(
                                fontSize: 22, // Tùy chỉnh kích thước văn bản
                                color: Colors.black54, // Màu văn bản
                              ),
                            ),
                          ),
                        ),
                      ));
                }),
              )),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount:
                  isTextNotEmpty ? filteredKeys.length : _letterData.length,
              itemBuilder: (context, index) {
                String key = isTextNotEmpty
                    ? filteredKeys[index]
                    : String.fromCharCode('A'.codeUnitAt(0) + index);
                Map<String, dynamic> data = _letterData[key] ?? {};
                List<String> keys = data.keys.toList();

                if (isTextNotEmpty) {
                  // Display only the inner column with the correct filtered keys
                  return Column(
                    children: filteredKeys.map((String subKey) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all<Size>(Size(400, 50)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            elevation: MaterialStatePropertyAll(4.0),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.orange),
                          ),
                          onPressed: () {
                            // Your button logic here
                          },
                          child: Text(subKey.toUpperCase(),
                              style: TextStyle(fontSize: 18)),
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  // Display the entire structure
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 380),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$key',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: keys.map((String subKey) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(400, 50)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                elevation: MaterialStatePropertyAll(4.0),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.orange),
                              ),
                              onPressed: () {
                                // Your button logic here
                              },
                              child: Text(subKey.toUpperCase(),
                                  style: TextStyle(fontSize: 18)),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
