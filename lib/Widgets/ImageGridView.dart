import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'package:test_downloading_youtube/Utilities/storeDataInGallery.dart';
import 'package:test_downloading_youtube/Screens/ImageView.dart';
class ImageGridView extends StatelessWidget {
String path;
ImageGridView({ required this.path});



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageView(path: path)));

        },
        child: Container(
          height: (120/843.43)*DeviceHieght(context),
          width: (120/411.43)*DeviceWidth(context),
          alignment: Alignment.center,
          color: Colors.black54,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(2),
          child: Container(
            child: Image.file(File('$path'),fit: BoxFit.fill,),
          ),
        ),
      ),
        Positioned(
          child: GestureDetector(
            onTap: (){
              create_directory(path);
              print('done');
            },
            child: Container(
              width: (28/411.43)*DeviceWidth(context),
              height:(25/843.43)*DeviceHieght(context),
              color: Colors.black45.withOpacity(0.6),
              child: Icon(Icons.download_rounded,color: Colors.white,),
            ),
          ),
        ),
      ]
    );
  }
}
