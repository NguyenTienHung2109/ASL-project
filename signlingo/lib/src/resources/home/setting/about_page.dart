import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(3.0), // Để loại bỏ khoảng trắng xung quanh nội dung

      // Thay đổi shape để bo tròn viền của AlertDialog
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),

      content: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
            color: Color.fromRGBO(240, 248, 255, 1)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Widget title ở giữa
            Center(
              child: Text(
                'Members',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            ),
            SizedBox(height: 40), // Khoảng trắng giữa title và content

            // Widget content ở giữa
            // Center(
            //   child: Text('Đây là nội dung của cửa sổ nổi.'),
            // ),
            // Widget actions
            Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Xử lý khi nút được nhấn
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(58, 223, 206, 1), // Màu nền của nút
                    ),
                    elevation: MaterialStateProperty.all<double>(
                        1), // Độ nổi lên
                    shadowColor: MaterialStateProperty.all<Color>(
                        Colors.grey), // Màu đổ bóng
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0, bottom: 15.0),
                    child: Text(
                      'Cancel',
                      style: const TextStyle(
                        fontSize: 18, // Tùy chỉnh kích thước văn bản
                        color: Colors.white, // Màu văn bản
                      ),
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}