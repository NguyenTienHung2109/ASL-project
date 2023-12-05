import 'package:flutter/material.dart';

class CorrectFooter extends StatelessWidget {
  late Function nextLesson;

  CorrectFooter({
    super.key,
    required this.nextLesson,
  });
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
                    color: Colors.lightGreen[100],
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
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 14, 154, 2),
                        // gradient: LinearGradient(colors: [

                        //   Colors.greenAccent.shade700
                        // ])
                      ),
                      // Màu nền của phần gợn sóng
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 20,
                      margin: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 20,
                          ),
                          Container(
                            width: 10.0,
                          ),
                          Text(
                            "Correct!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              // fontStyle: FontStyle.italic
                            ),
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
                              colors: [
                                Color.fromARGB(255, 92, 222, 85)!,
                                Color.fromARGB(255, 10, 206, 0)!
                              ],
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
                              "NEXT",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              nextLesson();
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
