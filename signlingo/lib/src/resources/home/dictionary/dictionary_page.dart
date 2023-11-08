import 'package:flutter/material.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<DictionaryPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          padding: const EdgeInsets.only(bottom: 10.0),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft:
                  Radius.circular(15), // Độ bo tròn của góc dưới bên trái
              bottomRight:
                  Radius.circular(15), // Độ bo tròn của góc dưới bên phải
            ),
          ),
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                  top: 25.0, right: 10.0, left: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0), // Bo tròn viền
                border: Border.all(
                  color: Colors.blueAccent, // Màu của đường viền
                  width: 1.0, // Độ rộng của đường viền
                ),
                color: Colors.white, // Màu nền
              ),
              child: TextField(
                controller: searchController,
                onChanged: (text) {
                  setState(() {
                    searchController.value = searchController.value.copyWith(
                      text: text[0].toUpperCase() + text.substring(1),
                      selection: TextSelection.collapsed(
                          offset: searchController.text.length),
                    );
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none, // Ẩn viền của TextField
                  hintText: 'Search for a word',
                  prefixIcon: Icon(Icons.search),
                ),
                style: const TextStyle(
                  fontSize:
                      18.0, // Đặt kích thước văn bản cho text trong TextField
                ),
              ),
            ),
            // Thêm danh sách các nút ở đây
            Container(
                height: 50,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.only(bottom: 10.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(26, (index) {
                    final char = String.fromCharCode('A'.codeUnitAt(0) + index);
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.0), // Thêm khoảng cách giữa các button
                      child: SizedBox(
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            // Xử lý khi nút được nhấn
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: const BorderSide(
                                    color: Colors.lightBlue, width: 1.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white, // Màu nền của nút
                            ),
                          ),
                          child: Container(
                            child: Text(
                              char,
                              style: const TextStyle(
                                fontSize: 18, // Tùy chỉnh kích thước văn bản
                                color: Colors.lightBlue, // Màu văn bản
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                )),
          ]),
        ),
        Expanded(
          child: ListView(
            children: List.generate(26, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blueAccent,
                        width: 2.0), // Đường viền xung quanh ExpansionTile
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      String.fromCharCode('A'.codeUnitAt(0) + index),
                      style: TextStyle(
                        fontSize: 22, // Đặt kích thước văn bản cho tiêu đề
                        color: Colors.blue, // Đổi màu chữ
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: List.generate(5, (subIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          title: ElevatedButton(
                            onPressed: () {
                              // Xử lý khi nút được nhấn
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: const BorderSide(
                                      color: Colors.lightBlue, width: 1.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white, // Màu nền của nút
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 15),
                              child: Text(
                                'Button ${subIndex + 1}',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                  height: 2.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
