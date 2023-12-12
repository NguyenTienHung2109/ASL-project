import 'package:flutter/material.dart';
import 'package:signlingo/src/bloc/home_bloc.dart';
import 'package:signlingo/src/database/home_database.dart';
import 'package:signlingo/src/resources/home/chapter/chapter.dart';

class Unit extends StatefulWidget {
  late int unit;
  String description = "";

  Unit({super.key, required this.unit});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UnitState();
  }
}

class _UnitState extends State<Unit> {
  List<Widget> result = [];
  Map<String, dynamic> _data = {};
  Future<void> getData() async {
    _data = await HomeData.getAllChapter("${widget.unit}");
  }

  Future<void> init() async {
    await getData();
    // print(_data);
    if (_data.isEmpty) {
      return;
    }
    result.clear();
    widget.description = _data["name"];
    // print(_data["name"]);
    for (int i = 0; i < _data["total"]; i++) {
      String key = "Chapter ${i + 1}";
      if (_data.containsKey(key)) {
        Map<String, dynamic> chapterData = _data[key];

        result.add(Chapter(
            chapter: i + 1,
            name: chapterData["name"],
            description: chapterData["description"],
            progress: 0,
            isLooking: false,
            items: HomeBloc.dynamicToStringList(chapterData["items"])));
      } else {
        print("Error: Can not find chapter ${i + 1}");
      }

      result.add(Container(
        height: 20.0,
        color: Colors.grey.shade200,
      ));
    }
    setState(() {
      if (_data.isNotEmpty) {
        _isLoading = false;
      }
    });
    // return result;
  }

  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> newUnit(int weight) async {
    if (await HomeBloc.newUnit(widget.unit, weight) && !_isLoading) {
      setState(() {
        _isLoading = true;
        widget.unit += weight;
        init();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _isLoading
        ? Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
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
                    // padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.grey.shade200,
                          child: TextButton(
                            onPressed: () {
                              newUnit(-1);
                            },
                            style: ButtonStyle(
                              alignment: Alignment.centerLeft,
                            ),
                            child: Icon(
                              Icons.arrow_left_rounded,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          // height: 125,
                          width: 250,
                          padding: const EdgeInsets.all(25.0),
                          // margin: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            border: Border.all(
                              color: Colors.white.withOpacity(0), // Màu viền
                              width: 0.1, // Độ dày của viền
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
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
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    runAlignment: WrapAlignment.center,
                                    children: [
                                      Text(
                                        widget.description,
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 20.0),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.grey.shade200,
                          child: TextButton(
                            onPressed: () {
                              newUnit(1);
                            },
                            style: ButtonStyle(
                              alignment: Alignment.centerLeft,
                            ),
                            child: Icon(
                              Icons.arrow_right_rounded,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  height: 25.0,
                  color: Colors.grey.shade200,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  width: 400,
                  color: Colors.grey.shade200,
                  child: Column(
                    children: result,
                  ),
                )
              ],
            ),
          );
  }
}
