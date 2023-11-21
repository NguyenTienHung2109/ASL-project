import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerExample extends StatefulWidget {
  final String videoUrl;
  const YoutubePlayerExample({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  State<YoutubePlayerExample> createState() => YoutubePlayerExampleState();
}

class YoutubePlayerExampleState extends State<YoutubePlayerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
          flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
              controlsVisibleAtStart: false,
              loop: true,
              hideThumbnail: true),
        ),
        showVideoProgressIndicator: false,
      )),
    );
  }
}
