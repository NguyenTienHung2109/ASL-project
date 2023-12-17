import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/element/video_youtube.dart';

class ChooseVideo extends StatefulWidget {
  ChooseVideo({Key? key}) : super(key: key);

  @override
  ChooseVideoState createState() => ChooseVideoState();
}

class ChooseVideoState extends State<ChooseVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("Choose the sign"),
        Container(
          height: 300,
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 200,
                    child: YoutubePlayerExample(
                      videoUrl: "https://www.youtube.com/watch?v=TBE802XB6_c",
                    ),
                  ),
                  ElevatedButton(onPressed: () => (), child: Text("click"))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: YoutubePlayerExample(
                  videoUrl: "https://www.youtube.com/watch?v=TBE802XB6_c",
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
