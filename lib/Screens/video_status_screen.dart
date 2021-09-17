import 'package:flutter/material.dart';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'package:test_downloading_youtube/Utilities/getWhatsappStatusDirectories.dart';
import 'package:video_player/video_player.dart';
import 'package:test_downloading_youtube/Widgets/ImageGridView.dart';
import 'package:test_downloading_youtube/Widgets/VideoGridView.dart';
import 'package:test_downloading_youtube/Screens/VideoView.dart';
import 'package:test_downloading_youtube/Screens/image_status_screen.dart';
class VideoStatus extends StatefulWidget {
  List file;
  List<VideoPlayerController> controllerList;
  VideoStatus({required this.file,required this.controllerList});

  @override
  _VideoStatusState createState() => _VideoStatusState();
}

class _VideoStatusState extends State<VideoStatus> {
  int videoNumber= 0;
  @override
  Widget build(BuildContext context) {

    return Container(
      height: DeviceHieght(context),
      width: DeviceWidth(context),
      // color: Colors.yellow,
      child: Column(
        children: [
          // Container(
          //   height: 100/843.43*DeviceHieght(context),
          //   width: DeviceWidth(context),
          //   color: Color(0xff009688),
          // ),
          // loader==true?CircularProgressIndicator():
      Expanded(
            child: Container(
              // color: Colors.red,
              child: GridView.builder
                (
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: widget.file.length,
                  itemBuilder:(BuildContext context, int index){
                    return VideoGridView(controller: widget.controllerList[videoNumber++],filePath: '${widget.file[index]}',);
                  }),
            ),
          ),
          // FlatButton(
          //     onPressed: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoView(path: '')));
          //     }
          //     , child: Icon(Icons.add)),
        ],
      ),
    );
  }
}
