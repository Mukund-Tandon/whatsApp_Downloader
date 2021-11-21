import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_status_saver/Utilities/DeviceData/deviceSize.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_status_saver/Screens/VideoView.dart';

class SavedVideoGridView extends StatefulWidget {
  String filePath;
  List file;
  int index;
  SavedVideoGridView(
      {this.filePath = '', required this.file, required this.index});

  @override
  _SavedVideoGridViewState createState() => _SavedVideoGridViewState();
}

class _SavedVideoGridViewState extends State<SavedVideoGridView> {
  late VideoPlayerController controller;
  void initialize() async {
    controller = VideoPlayerController.file(File('${widget.filePath}'));
    await controller.initialize();

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double containerHeight = (130 / 843.43) * DeviceHieght(context);
    double containerwidth = (135 / 411.43) * DeviceWidth(context);
    return Container(
      height: containerHeight,
      width: containerwidth,
      margin: EdgeInsets.only(top: 10),
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VideoView(
                          path: widget.filePath,
                          isSaved: true,
                        )));
          },
          child: Container(
            height: containerHeight,
            width: containerwidth,
            alignment: Alignment.center,
            // color: Colors.black54,
            margin: EdgeInsets.all(6),
            // padding: EdgeInsets.all(2),
            child: controller.value.isInitialized
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: VideoPlayer(controller))
                : CircularProgressIndicator(),
          ),
        ),
        Positioned(
            top: .35 * containerHeight,
            left: .35 * containerwidth,
            child: GestureDetector(
              onTap: () {
                print('touch');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoView(
                              path: widget.filePath,
                              isSaved: true,
                            )));
              },
              child: Container(
                width: (28 / 411.43) * DeviceWidth(context),
                height: (25 / 843.43) * DeviceHieght(context),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            )),
      ]),
    );
  }
}
