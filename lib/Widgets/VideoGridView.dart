import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_downloading_youtube/Models/savedStatusListModel.dart';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'package:video_player/video_player.dart';
import 'package:test_downloading_youtube/Screens/item_select_screen.dart';
import 'package:test_downloading_youtube/Screens/VideoView.dart';
import 'package:test_downloading_youtube/Utilities/storeDataInGallery.dart';
import 'package:provider/provider.dart';
class VideoGridView extends StatefulWidget {
  String filePath;

  List file;
  int index;
  VideoGridView({this.filePath='', required this.file , required this.index});

  @override
  _VideoGridViewState createState() => _VideoGridViewState();
}

class _VideoGridViewState extends State<VideoGridView> {
  bool isSaved= false;//checks if the image is saved or not !! more work to do on this ----!!!>> remove download symbol when downloaded
  late VideoPlayerController controller;
  void initialize()async{
    controller = VideoPlayerController.file(File('${widget.filePath}'));
    await controller.initialize();

    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkSaved();
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
    double containerHeight= (130/843.43)*DeviceHieght(context);
    double containerwidth= (135/411.43)*DeviceWidth(context);
    return Container(
      height:containerHeight,
      width: containerwidth,
      margin: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          GestureDetector(
          onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoView(path: widget.filePath,isSaved: isSaved,)));

          },
            onLongPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectItem(file: widget.file, index: widget.index)));
            },
          child: Container(
            height:containerHeight,
            width: containerwidth,
            alignment: Alignment.center,
            margin: EdgeInsets.all(6),
            child: controller.value.isInitialized?ClipRRect(
              borderRadius: BorderRadius.circular(15),
                child: VideoPlayer(controller)):CircularProgressIndicator(),
          ),
        ),
          Positioned(
              top: .30*containerHeight,
              left:.35*containerwidth,
              child: GestureDetector(
                onTap: (){
                  print('touch');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoView(path: widget.filePath,isSaved: false,)));//videoPlayer (lib/Screens/VideoView)
                },
                child: Container(
            width: (28/411.43)*DeviceWidth(context),
            height:(25/843.43)*DeviceHieght(context),
            child: Icon(Icons.play_arrow,color: Colors.white,size: 35,),
          ),
              )),
          isSaved?Container(height: 0,width: 0,):Positioned(
            top: .65*containerHeight,
            left:.37*containerwidth,
            child: Container(
              height: .25*containerHeight,
              width: .25*containerwidth,
              child: FloatingActionButton(
                heroTag: 'btn${widget.index}',
                backgroundColor: Color(0xff009688),
                onPressed:(){
                  create_directory(widget.filePath);//saved to gallery(lib/Utilities/storeDataInGallery)
                },
                child: Icon(Icons.download_rounded,color: Colors.white,),

              ),
            ),
          ),
        ]
      ),
    );
  }
}
