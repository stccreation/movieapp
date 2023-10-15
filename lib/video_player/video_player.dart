
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

int? fileid;
class VideoPlayerm extends StatefulWidget {
  const VideoPlayerm({super.key});

  @override
  State<VideoPlayerm> createState() => _VideoPlayermState();
}

class _VideoPlayermState extends State<VideoPlayerm> {
  late BetterPlayerController _betterPlayerController;

  @override
void initState(){
    super.initState();
  BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://f.stcmovies.ml/video/${fileid}.mp4");
    _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(),
        betterPlayerDataSource: betterPlayerDataSource);
      _betterPlayerController.setBetterPlayerControlsConfiguration(BetterPlayerControlsConfiguration(enableAudioTracks: true));

  }
  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 16/9,
    child: BetterPlayer(controller: _betterPlayerController),
    );
  }
}