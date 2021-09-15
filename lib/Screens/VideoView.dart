import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
class VideoView extends StatelessWidget {
  String path;
  VideoView({required this.path});

  @override
  Widget build(BuildContext context) {
    VideoPlayerController videoPlayerController = VideoPlayerController.file(File('$path'));
    ChewieController chewieController = ChewieController(
        videoPlayerController: videoPlayerController,autoPlay: true);
    return Scaffold(
      body: Container(
          color: Colors.black,
          height: DeviceHieght(context),
          width: DeviceWidth(context),
        child: Chewie(controller: chewieController),
      ),
    );
  }
}
