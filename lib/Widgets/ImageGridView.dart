import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_status_saver/Utilities/DeviceData/deviceSize.dart';
import 'package:whatsapp_status_saver/Utilities/storeDataInGallery.dart';
import 'package:whatsapp_status_saver/Screens/ImageView.dart';
import 'package:whatsapp_status_saver/Screens/item_select_screen.dart';

class ImageGridView extends StatefulWidget {
  String path; //to be  passed to Image View
  List file; //to be passd to selected item screen
  int index; //to be passed to selected item Screen to keep ckech which image was pressed
  ImageGridView({required this.path, required this.file, required this.index});

  @override
  _ImageGridViewState createState() => _ImageGridViewState();
}

class _ImageGridViewState extends State<ImageGridView> {
  bool isSaved =
      false; //checks if the image is saved or not !! more work to do on this ----!!!>> remove download symbol when downloaded

  @override
  Widget build(BuildContext context) {
    double containerHeight = (130 / 843.43) * DeviceHieght(context);
    double containerwidth = (135 / 411.43) * DeviceWidth(context);
    return Container(
      height: containerHeight,
      width: containerwidth,
      margin: EdgeInsets.only(top: 10),
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageView(
                          path: widget.path,
                          isSaved: false,
                        ))); //(lib/Screens/ImageView.dart)
          },
          onLongPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SelectItem(
                          file: widget.file,
                          index: widget.index,
                        ))); //(lib/Screens/item_select_screeen.dart)
          },
          child: Container(
            height: containerHeight,
            width: containerwidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black54,
            ),
            margin: EdgeInsets.all(6),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  File('${widget.path}'),
                  fit: BoxFit.fill,
                )),
          ),
        ),
        //!!!->>work to do on isSaved
        isSaved
            ? Container(
                width: 0,
                height: 0,
              )
            : Positioned(
                top: .65 * containerHeight,
                left: .37 * containerwidth,
                child: Container(
                  height: .25 * containerHeight,
                  width: .25 * containerwidth,
                  child: FloatingActionButton(
                    heroTag: 'btn${widget.index}',
                    backgroundColor: Color(0xff009688),
                    onPressed: () {
                      create_directory(widget
                          .path); //saved to gallery(lib/Utilities/storeDataInGallery)
                    },
                    child: Icon(
                      Icons.download_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
      ]),
    );
  }
}
