import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'package:test_downloading_youtube/Utilities/getWhatsappStatusDirectories.dart';
import 'package:video_player/video_player.dart';
import 'package:test_downloading_youtube/Widgets/savedimagesView.dart';
import 'package:test_downloading_youtube/Widgets/VideoGridView.dart';
import 'package:test_downloading_youtube/Screens/VideoView.dart';
import 'package:test_downloading_youtube/Screens/image_status_screen.dart';
import 'package:test_downloading_youtube/Screens/video_status_screen.dart';
import 'package:test_downloading_youtube/Utilities/getSavedFiles.dart';
class SavedStatus extends StatefulWidget {

  @override
  _SavedStatusState createState() => _SavedStatusState();
}

class _SavedStatusState extends State<SavedStatus> {
  List file= [];
  int videoNumber= 0;
  List videoFile=[];
  List imageFile=[];
  List<VideoPlayerController> controllerlist=[];
  void getDirectoryFiles()async{
    print('1');
    file =await getSavedStatusFiles();
    setVideoController();
    print('1');
    setState(() {

    });
    print('1');
  }

  void setVideoController()async{
    print(file.length);
    int c= 0;//used for iterating controlList at line 47
    for(int i= 0; i<file.length;i++){
      print(i);
      if(file[i].toString().endsWith('.mp4')){
        print(file[i]);
        VideoPlayerController controller= VideoPlayerController.file(File('${file[i]}'));
        controllerlist.add(controller);
        print('ss1');
        videoFile.add('${file[i]}');
        await controllerlist[c].initialize().then((value) => {
          setState(() {
            c++;
            print('sss');
          })
        });
      }
      else{
        imageFile.add('${file[i]}');
      }

    }
    print('total = ${controllerlist.length}');
    // _controller[index] = VideoPlayerController.file(File('$path'));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('staete Init');
    getDirectoryFiles();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispo');
    for(int i= 0; i<videoNumber;i++){
      controllerlist[i].dispose();
    }
    // _controller.dispose();
  }
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
                  itemCount: file.length,
                  itemBuilder:(BuildContext context, int index){
                    return SavedImagesGridView(path: '${file[index]}',file: file,index: index,);
                  }),
            ),
          ),

        ],
      ),
    );
  }
}
