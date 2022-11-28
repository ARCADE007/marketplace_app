import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerExample extends StatefulWidget {
  const YoutubePlayerExample({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  State<YoutubePlayerExample> createState() => _YoutubePlayerExampleState();

  final String videoUrl;
}

class _YoutubePlayerExampleState extends State<YoutubePlayerExample> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(widget.videoUrl);

    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(autoPlay: false));
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }
}
