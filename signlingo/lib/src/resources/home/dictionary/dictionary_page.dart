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
          // margin: const EdgeInsets.only(bottom: 10.0),
          // padding: const EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
            color: Colors.yellow.shade50,
            borderRadius: const BorderRadius.only(
              bottomLeft:
                  Radius.circular(0), // Độ bo tròn của góc dưới bên trái
              bottomRight:
                  Radius.circular(0), // Độ bo tròn của góc dưới bên phải
            ),
          ),
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                  top: 25.0, right: 10.0, left: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), // Bo tròn viền
                border: Border.all(
                  color: Colors.black, // Màu của đường viền
                  width: 0.7, // Độ rộng của đường viền
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
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0, 5.0),
                color: Colors.yellow.shade50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(26, (index) {
                    final char = String.fromCharCode('A'.codeUnitAt(0) + index);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
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
                                borderRadius: BorderRadius.circular(7.0),
                                side: const BorderSide(
                                    color: Colors.grey, width: 0.8),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white, // Màu nền của nút
                            ),
                            elevation: MaterialStateProperty.all<double>(
                                2), // Độ nổi lên
                            shadowColor: MaterialStateProperty.all<Color>(
                                Colors.grey), // Màu đổ bóng
                          ),
                          child: Container(
                            child: Text(
                              char,
                              style: const TextStyle(
                                fontSize: 18, // Tùy chỉnh kích thước văn bản
                                color: Colors.black54, // Màu văn bản
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                )),
            Container(
              height: 5.0,
              color: Colors.yellow.shade50,
            )
          ]),
        ),
        Container(
          height: 5.0,
          color: Colors.yellow.shade50,
        ),
        (Expanded(
          child: ListView(
            children: List.generate(26, (index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                color: Colors.yellow.shade50,
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade50,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey, // Màu đổ bóng
                        spreadRadius: 0.5, // Độ mở rộng của đổ bóng
                        blurRadius: 3, // Độ mờ của đổ bóng
                        offset: Offset(0, 2), // Vị trí đổ bóng
                      )
                    ],
                    // border: Border.all(
                    //     color: Colors.black45,
                    //     width: 0.5), // Đường viền xung quanh ExpansionTile
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      String.fromCharCode('A'.codeUnitAt(0) + index),
                      style: const TextStyle(
                        fontSize: 22, // Đặt kích thước văn bản cho tiêu đề
                        color: Colors.black54, // Đổi màu chữ
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
                                  // side: const BorderSide(
                                  //     color: Colors.lightBlue, width: 1.0),
                                ),
                              ),
                              elevation: MaterialStateProperty.all<double>(
                                  4.0), // Độ nổi lên
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.grey), // Màu đổ bóng
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.yellow.shade50, // Màu nền của nút
                              ),
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 15),
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
        )),
      ],
    );
  }
}
