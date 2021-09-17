import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'package:test_downloading_youtube/Utilities/storeDataInGallery.dart';
import 'package:test_downloading_youtube/Models/selectedItemscount.dart';
import 'package:test_downloading_youtube/Utilities/GlobalVariables.dart';
import 'package:provider/provider.dart';
class SelectedImage extends StatefulWidget {
  String path;
  bool isSelected;
  SelectedImage({ required this.path,required this.isSelected});

  @override
  _SelectedImageState createState() => _SelectedImageState();
}

class _SelectedImageState extends State<SelectedImage> {

  void toogleSelected(){
    widget.isSelected= !widget.isSelected;
    if(widget.isSelected==true){
      setState(() {
        imageList_shareddownloaded.add('${widget.path}');
        Provider.of<SelectedItemCount>(context,listen: false).increase();
        print(imageList_shareddownloaded.length);
      });

    }
    else{
      setState(() {
        imageList_shareddownloaded.remove('${widget.path}');
        Provider.of<SelectedItemCount>(context,listen: false).decrease();
        print(imageList_shareddownloaded.length);
      });

    }
    setState(() {

    });
  }
  @override

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (130/843.43)*DeviceHieght(context),
      width: (130/411.43)*DeviceWidth(context),
      alignment: Alignment.center,
      margin: EdgeInsets.all(0),
      // color: Colors.pink,

      child: Stack(
        // alignment: Alignment.center,
        //   fit: StackFit.expand,
          children: [
            Container(
              height:(130/843.43)*DeviceHieght(context),
              width:(130/411.43)*DeviceWidth(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),

              ),
              // alignment: Alignment.center,
              // color: Colors.black54,
              margin:widget.isSelected? EdgeInsets.all(6):EdgeInsets.all(0),

              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.file(File('${widget.path}'),fit: BoxFit.fill,)),
            ),
            GestureDetector(
              onTap: (){
                toogleSelected();
              },
              child: Container(
                height:(130/843.43)*DeviceHieght(context),
                width:(130/411.43)*DeviceWidth(context),
                margin:widget.isSelected? EdgeInsets.all(6):EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color:widget.isSelected? Colors.black54.withOpacity(.5):Colors.transparent,
                ),
                child: Container(
                  child: Icon(
                    Icons.check,
                    color:widget.isSelected? Colors.white:Colors.transparent,
                    size: 40,
                  ),
                ),
              ),
            )
          ]
      ),
    );
  }
}