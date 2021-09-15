import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'dart:io';
class ImageView extends StatelessWidget {
String path;
ImageView({required this.path});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      ),
      child: Scaffold(
        body: Container(
          color: Colors.black,
          height: DeviceHieght(context),
          width: DeviceWidth(context),
          child: Column(
            children: [
              // Container(
              //   height: 100,
              //   width: DeviceWidth(context),
              //   child: Icon(Icons.download_rounded,color: Colors.white,size: 30,),
              // ),
              Expanded(child: Container(
                child: InteractiveViewer(
                  child: Container(
                    child: Image.file(File('$path')),
                  ),),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
