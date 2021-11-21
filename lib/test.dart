import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_downloading_youtube/Utilities/instadownloads.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as p;
import 'package:test_downloading_youtube/Utilities/getimageFileFromUrl.dart';
import 'package:test_downloading_youtube/Utilities/getWhatsappStatusDirectories.dart';
import 'package:media_scanner/media_scanner.dart';
import 'package:video_player/video_player.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List file = [];
  int video_number = 0;
  // late VideoPlayerController _controller;
  List<VideoPlayerController> _controller = [];
  void instaLinkDownload(String url) async {
    String imgUrl = await getData('$url');
    create_directory(imgUrl);
  }

  void getDirectoryFiles() async {
    print('1');
    file = await getWhatsAppStatusFiles(context);
    setVideoController();
    print('1');
    setState(() {
      print(file.length);
    });
    print('1');
  }

  void setVideoController() async {
    print('s');
    int c = 0;
    for (int i = 0; i < file.length; i++) {
      print(i);
      if (file[i].toString().endsWith('.mp4')) {
        print(file[i]);
        VideoPlayerController controller =
            VideoPlayerController.file(File('${file[i]}'));
        _controller.add(controller);
        print('ss1');
        await _controller[c].initialize().then((value) => {
              setState(() {
                c++;
                print('sss');
              })
            });
      }
    }
    // _controller[index] = VideoPlayerController.file(File('$path'));
  }

  // static const platform = MethodChannel('Files');
  // Future<List> getFiles()async{
  //   List<File> f= await platform.invokeMethod('getFiles');
  //   return f;
  // }
  @override
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for (int i = 0; i < video_number; i++) {
      _controller[i].dispose();
    }
    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String url = '';
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                height: 100,
                child: TextField(
                  onChanged: (text) {
                    url = text;
                    print(url);
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  print("b");
                  print(url);
                  print("b");
                  // create_directory();
                  instaLinkDownload(url);

                  print("b");
                },
                child: Text('Print'),
              ),
              // Expanded(
              //   child: Container(
              //     height: 200,
              //     child: ListView.builder(
              //         itemCount: file.length,
              //         itemBuilder: (BuildContext context, int index) {
              //           return Container(
              //             color: Colors.pink,
              //             child: Container(
              //               color: Colors.yellow,
              //               // margin: EdgeInsets.,
              //               height: 120,
              //               width: 50,
              //               child:file[index].toString().endsWith('.mp4')==false? Image.file(File('${file[index]}'),fit: BoxFit.contain,):
              //               _controller[video_number].value.isInitialized?VideoPlayer(_controller[video_number++]):CircularProgressIndicator(),
              //             ),
              //           );
              //
              //         }),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

void create_directory(String url) async {
  bool status = await Permission.storage.status.isDenied;

  print(status);
  if (status == true) {
    await Permission.storage.request();
  }
  print('done');
  File image = await getImageFileFromUrl(url);
  print(image.path);
  Directory? d = await getExternalStorageDirectory();
  print(d!.path);
  final extDir = await Directory('/storage/emulated/0/DCIM/testApp')
      .create(recursive: true);
  print('done');

// Path of file
  final myImagePath = '${extDir.path}/Picsdd';
  print('done');

// Create directory inside where file will be saved
  await new Directory(myImagePath).create();
  print('d');
  final filename = p.basename('');
  print('done');
// File copied to ext directory.
  File newImage = await image.copy("$myImagePath/inta.mp4");
  var load = await MediaScanner.loadMedia(path: '${myImagePath}');
  print(newImage.path);
}
