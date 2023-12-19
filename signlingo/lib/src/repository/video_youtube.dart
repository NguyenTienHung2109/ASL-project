import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:signlingo/src/bloc/learning_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoYoutube extends StatefulWidget {
  late String word;

  VideoYoutube(String _word) {
    word = _word;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VideoYoutubeState();
  }
}

class _VideoYoutubeState extends State<VideoYoutube> {
  late YoutubePlayerController _controller;
  late int id;
  late String title;
  late String videoUrl;
  bool _isLoading = true;

  Future<Map<String, dynamic>> getVideo(String word) async {
    FirebaseFirestore database = FirebaseFirestore.instance;
    if (word.isEmpty) return {};
    String upper = LearningBloc.toUpper(word);
    final docRef = database.collection("Dictionary").doc(upper[0]);
    // print(docRef);

    try {
      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        Map<String, dynamic> result = doc.data() as Map<String, dynamic>;
        // print(result);
        // print(result[LearningBloc.toLower(word)]);
        // print(LearningBloc.toLower(word));
        if (result.containsKey(LearningBloc.toLower(word))) {
          return result[LearningBloc.toLower(word)];
        }
      } else {
        print("Document does not exist");
      }
    } catch (e) {
      print("Error: $e");
    }
    return {};
  }

  Future<void> initID() async {
    Map<String, dynamic> temp = await getVideo(widget.word);
    id = temp["id"];
    title = temp["title"];
    videoUrl = temp["link"];
  }

  Future<void> initController() async {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        controlsVisibleAtStart: false,
        loop: true,
        // hideThumbnail: true,
        hideControls: true,
        // disableDragSeek: true,
      ),
    );
    // Disable user interactions
    _controller.pause();
    _controller.seekTo(const Duration(seconds: 0));
  }

  Future<void> init() async {
    await initID();
    await initController();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
      child: _isLoading
          ? Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              width: 350,
              height: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: false,
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(isExpanded: true),
                    ],
                  ),
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(_isLoading
                          ? 0.8
                          : 0), // Set opacity based on isLoading
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.white.withOpacity(1),
                      child: Text(
                        "hello",
                        style: TextStyle(
                          color: Colors.white, // Adjust the text color
                          fontSize: 18.0,
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
