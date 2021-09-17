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
class ImageStatus extends StatefulWidget {
List file;
ImageStatus({required this.file});

  @override
  _ImageStatusState createState() => _ImageStatusState();
}

class _ImageStatusState extends State<ImageStatus> {
  // bool loader= true;
  // List file=[];
  // int videoNumber= 0;
  // List<VideoPlayerController> controllerlist=[];
  // void setVideoController()async{
  //   print(file.length);
  //   int c= 0;
  //   for(int i= 0; i<file.length;i++){
  //     print(i);
  //     if(file[i].toString().endsWith('.mp4')){
  //       print(file[i]);
  //       VideoPlayerController controller= VideoPlayerController.file(File('${file[i]}'));
  //       controllerlist.add(controller);
  //       print('ss1');
  //       await controllerlist[c].initialize().then((value) => {
  //         setState(() {
  //           c++;
  //           print('sss');
  //         })
  //       });
  //     }
  //
  //   }
  //   print('total = ${controllerlist.length}');
  //   // _controller[index] = VideoPlayerController.file(File('$path'));
  // }
  // void getDirectoryFiles()async{
  //   print('1');
  //   file =await getWhatsAppStatusFiles();
  //   setVideoController();
  //   print('1');
  //   setState(() {
  //     loader=false;
  //   });
  //   print('1');
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getDirectoryFiles();
  // }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   for(int i= 0; i<videoNumber;i++){
  //     controllerlist[i].dispose();
  //   }
  //   // _controller.dispose();
  // }
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
                    return ImageGridView(path: '${widget.file[index]}',file: widget.file,index: index,);
                  }),
            ),
          ),

        ],
      ),
    );
  }
}
