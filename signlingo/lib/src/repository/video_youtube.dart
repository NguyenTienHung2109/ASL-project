import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoYoutube extends StatefulWidget {
  late int id;
  late String title;
  late String videoUrl;

  VideoYoutube(
      {super.key,
      required this.id,
      required this.title,
      required this.videoUrl});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VideoYoutubeState();
  }
}

class _VideoYoutubeState extends State<VideoYoutube> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: YoutubePlayer(
          controller: YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
              flags: const YoutubePlayerFlags(
                  autoPlay: true,
                  mute: true,
                  controlsVisibleAtStart: false,
                  loop: true,
                  hideThumbnail: true)),
          showVideoProgressIndicator: false,
        ));
  }
}
