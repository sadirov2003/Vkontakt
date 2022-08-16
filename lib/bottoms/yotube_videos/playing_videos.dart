import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayingVideos extends StatefulWidget {
  final String youtubeKey;
  PlayingVideos({
    required this.youtubeKey,
  });

  @override
  State<PlayingVideos> createState() => _PlayingVideosState();
}

class _PlayingVideosState extends State<PlayingVideos> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final player = YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youtube Videos'),
        centerTitle: true,
      ),
      body: Center(
        child: player,
      ),
    );
  }
}
