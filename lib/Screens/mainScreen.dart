import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'package:test_downloading_youtube/Utilities/getWhatsappStatusDirectories.dart';
import 'package:video_player/video_player.dart';
import 'package:test_downloading_youtube/Screens/image_status_screen.dart';
import 'package:test_downloading_youtube/Screens/video_status_screen.dart';
import 'package:test_downloading_youtube/Screens/savedStatus.dart';

class MainScreen extends StatefulWidget {


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool loader= true;
  List file=[];
  int videoNumber= 0;
  List videoFile=[];
  List imageFile=[];
  List<VideoPlayerController> controllerlist=[];
  void getDirectoryFiles()async{
    print('1');
    file =await getWhatsAppStatusFiles();
     setVideoController();
    print('1');
    setState(() {
      loader=false;
    });
    print('1');
  }

  void setVideoController()async{
    print(file.length);
    int c= 0;
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
    getDirectoryFiles();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for(int i= 0; i<videoNumber;i++){
      controllerlist[i].dispose();
    }
    // _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              width: DeviceWidth(context),
              alignment: Alignment.center,
              child: Text(
                'Status Downloader'
              ),
            ),
            backgroundColor:Color(0xff009688),
            bottom: TabBar(
              indicatorColor: Colors.white,
              physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              tabs: [
                Tab(
                  text: 'Images',
                ),
                Tab(
                  text: 'Videos',
                ),
                Tab(
                  text: 'Saved',
                )
              ],
            ),
          ),
          body: loader==true?CircularProgressIndicator():TabBarView(
            children: [
              ImageStatus(file: imageFile,),
              VideoStatus(file: videoFile,controllerList: controllerlist,),
              SavedStatus(),
            ],
          ),
        ),
      ),
    );
  }
}
