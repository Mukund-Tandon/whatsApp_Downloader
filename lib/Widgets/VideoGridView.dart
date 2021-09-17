import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'package:video_player/video_player.dart';
import 'package:test_downloading_youtube/Utilities/storeDataInGallery.dart';
import 'package:test_downloading_youtube/Screens/VideoView.dart';
class VideoGridView extends StatefulWidget {
  String filePath;
  VideoPlayerController controller;
  VideoGridView({this.filePath='', required this.controller});

  @override
  _VideoGridViewState createState() => _VideoGridViewState();
}

class _VideoGridViewState extends State<VideoGridView> {
  void initialize()async{
    await widget.controller.initialize();
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (135/843.43)*DeviceHieght(context),
      width: (135/411.43)*DeviceWidth(context),
      margin: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          GestureDetector(
          onTap: (){
            print('touch');
            Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoView(path: widget.filePath)));

          },
          child: Container(
            height: (135/843.43)*DeviceHieght(context),
            width: (135/411.43)*DeviceWidth(context),
            // color: Colors.black54,
            margin: EdgeInsets.all(6),
            // padding: EdgeInsets.all(2),
            child: widget.controller.value.isInitialized?ClipRRect(
              borderRadius: BorderRadius.circular(15),
                child: VideoPlayer(widget.controller)):CircularProgressIndicator(),
          ),
        ),
          // Positioned(
          //   child: GestureDetector(
          //     onTap: (){
          //       create_directory(widget.filePath);
          //       print('done');
          //     },
          //     child: Container(
          //       width: (28/411.43)*DeviceWidth(context),
          //       height:(25/843.43)*DeviceHieght(context),
          //       color: Colors.black45.withOpacity(0.6),
          //       child: Icon(Icons.download_rounded,color: Colors.white,),
          //     ),
          //   ),
          // ),
          Positioned(
            top: 40,
              left: 35,
              child: GestureDetector(
                onTap: (){
                  print('touch');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoView(path: widget.filePath)));
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
