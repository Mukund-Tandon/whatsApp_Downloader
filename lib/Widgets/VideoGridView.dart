import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'package:video_player/video_player.dart';
import 'package:test_downloading_youtube/Utilities/storeDataInGallery.dart';
import 'package:test_downloading_youtube/Screens/VideoView.dart';
class VideoGridView extends StatelessWidget {
  String filePath;
  VideoPlayerController controller;
  VideoGridView({this.filePath='', required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (120/843.43)*DeviceHieght(context),
      width: (100/411.43)*DeviceWidth(context),
      child: Stack(
        children: [
          GestureDetector(
          onTap: (){
            print('touch');
            Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoView(path: filePath)));

          },
          child: Container(
            height: (120/843.43)*DeviceHieght(context),
            width: (100/411.43)*DeviceWidth(context),
            color: Colors.black54,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(2),
            child: controller.value.isInitialized?Container(
              child: VideoPlayer(controller),
            ):CircularProgressIndicator(),
          ),
        ),
          Positioned(
            child: GestureDetector(
              onTap: (){
                create_directory(filePath);
                print('done');
              },
              child: Container(
                width: (28/411.43)*DeviceWidth(context),
                height:(25/843.43)*DeviceHieght(context),
                color: Colors.black45.withOpacity(0.6),
                child: Icon(Icons.download_rounded,color: Colors.white,),
              ),
            ),
          ),
          Positioned(
            top: 40,
              left: 35,
              child: GestureDetector(
                onTap: (){
                  print('touch');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoView(path: filePath)));
                },
                child: Container(
            width: (28/411.43)*DeviceWidth(context),
            height:(25/843.43)*DeviceHieght(context),
            color: Colors.black45.withOpacity(0.6),
            child: Icon(Icons.play_arrow,color: Colors.white,),
          ),
              ))
        ]
      ),
    );
  }
}
