import 'package:flutter/material.dart';

class IncorrectFooter extends StatelessWidget {
  late Function nextLesson;
  late Function resetLesson;
  late bool type;
  // type = 0: Try Again
  // type = 1: Next Lesson

  IncorrectFooter(
      {super.key,
      required this.nextLesson,
      required this.resetLesson,
      required this.type});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: 120,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: Colors.red[100],
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Colors.red[700], // Màu nền của phần gợn sóng
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 20,
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: 20,
                      ),
                      Container(
                        width: 10.0,
                      ),
                      Text(
                        "Incorrect!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.deepOrange!, Colors.deepOrange[700]!],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        // color: Colors.amber.shade900,
                        border: Border.all(
                          width: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Center(
                          child: TextButton(
                        child: Text(
                          type == true ? "NEXT" : "TRY AGAIN",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          if (type == true) {
                            nextLesson();
                          } else {
                            resetLesson();
                          }
                        },
                      ))),
                ),
              ],
            )
          ],
        ));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Bắt đầu từ điểm góc trên bên trái
    path.moveTo(0, 5);

    // Tạo một sóng bằng quadraticBezierTo
    // Tạo sóng thứ nhất
    path.quadraticBezierTo(
      size.width / 4,
      size.height / 20 - 1, // Điều chỉnh đây để giảm độ cong của sóng
      size.width / 2,
      1,
    );
    path.quadraticBezierTo(
      size.width * 3 / 4,
      size.height / 20 - 1, // Điều chỉnh đây để giảm độ cong của sóng
      size.width,
      3,
    );
    // Kết thúc tại điểm góc trên bên phải
    path.lineTo(size.width, size.height);

    // Kết thúc tại điểm góc trên bên trái
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
