import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool loader = true;
  List file =
      []; //stores the copmplete .statusse directory of whatsapp recieved from getWhatsAppStatusFiles() :LINE 25
  List videoFile = []; // stores all videos for videos tab
  List imageFile = []; //stores all images for the images tab

  //function to get all statuses from whatsapp
  void getDirectoryFiles() async {
    file = await getWhatsAppStatusFiles(context);
    sortImageandVideo();
    setState(() {
      loader = false;
    });
  }

  // put images and video in different files
  void sortImageandVideo() async {
    for (int i = 0; i < file.length; i++) {
      if (file[i].toString().endsWith('.mp4')) {
        //condition to seperate video files
        videoFile.add('${file[i]}');
      } else {
        imageFile.add('${file[i]}');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getDirectoryFiles();
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
            automaticallyImplyLeading: false,
            title: Container(
              width: DeviceWidth(context),
              alignment: Alignment.center,
              child: Text('Status Downloader'),
            ),
            backgroundColor: Color(0xff009688),
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
          body: loader == true
              ? CircularProgressIndicator()
              : TabBarView(
                  children: [
                    ImageStatus(
                      file: imageFile,
                    ), //(lib/Screens/image_status_screen.dart)
                    VideoStatus(
                      file: videoFile,
                    ), //(lib/Screens/video_status_screen.dart)
                    SavedStatus(), //(lib/Screens/savedStatus.dart)
                  ],
                ),
        ),
      ),
    );
  }
}
