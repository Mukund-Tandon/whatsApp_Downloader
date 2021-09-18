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
    double containerHeight= (130/843.43)*DeviceHieght(context);
    double containerwidth= (135/411.43)*DeviceWidth(context);
    return Container(
      height: containerHeight,
      width: containerwidth,

      margin: EdgeInsets.only(top: 10),
      child: Stack(
        children: [GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageView(path: path,isSaved: false,)));

          },
          onLongPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectItem(file: file,index: index,)));
          },
          child: Container(
            height: containerHeight,
            width: containerwidth,
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
            top: .65*containerHeight,
            left:.37*containerwidth,
            child: Container(
              height: .25*containerHeight,
              width: .25*containerwidth,
              child: FloatingActionButton(
                heroTag: 'btn$index',
                backgroundColor: Color(0xff009688),
                onPressed:(){

                  create_directory(path);
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
