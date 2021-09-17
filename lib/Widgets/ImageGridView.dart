import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'package:test_downloading_youtube/Utilities/storeDataInGallery.dart';
import 'package:test_downloading_youtube/Screens/ImageView.dart';
import 'package:test_downloading_youtube/Screens/item_select_screen.dart';
class ImageGridView extends StatelessWidget {
String path;
List file;
int index;
ImageGridView({ required this.path, required this.file, required this.index});



  @override
  Widget build(BuildContext context) {
    return Container(
      height: (135/843.43)*DeviceHieght(context),
      width: (135/411.43)*DeviceWidth(context),
      margin: EdgeInsets.only(top: 10),
      child: Stack(
        children: [GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageView(path: path)));

          },
          onLongPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectItem(file: file,index: index,)));
          },
          child: Container(
            height: (135/843.43)*DeviceHieght(context),
            width: (135/411.43)*DeviceWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black54,
            ),
            // alignment: Alignment.center,
            // color: Colors.black54,
            margin: EdgeInsets.all(6),
            // padding: EdgeInsets.all(2),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(File('$path'),fit: BoxFit.fill,)),
          ),
        ),
          Positioned(
            top: 6,
            left:(103/411.43)*DeviceWidth(context),
            child: GestureDetector(
              onTap: (){
                create_directory(path);
                print('done');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(15),bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                  color: Color(0xff009688).withOpacity(0.9),
                ),
                width: (28/411.43)*DeviceWidth(context),
                height:(25/843.43)*DeviceHieght(context),

                child: Icon(Icons.download_rounded,color: Colors.white,),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
