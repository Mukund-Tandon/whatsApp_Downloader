import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_status_saver/Utilities/DeviceData/deviceSize.dart';
import 'package:whatsapp_status_saver/Utilities/deletefile.dart';
import 'package:whatsapp_status_saver/Screens/ImageView.dart';
import 'package:whatsapp_status_saver/Screens/item_select_screen.dart';

class SavedImagesGridView extends StatefulWidget {
  String path;
  List file;
  int index;
  SavedImagesGridView(
      {required this.path, required this.file, required this.index});

  @override
  _SavedImagesGridViewState createState() => _SavedImagesGridViewState();
}

class _SavedImagesGridViewState extends State<SavedImagesGridView> {
  @override
  Widget build(BuildContext context) {
    double containerHeight = (135 / 843.43) * DeviceHieght(context);
    double containerwidth = (135 / 411.43) * DeviceWidth(context);
    return Container(
      height: containerHeight,
      width: containerwidth,
      margin: EdgeInsets.only(top: 10),
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            path: widget.path,
                            isSaved: true,
                          )));
            });
          },
          child: Container(
            height: containerHeight,
            width: containerwidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black54,
            ),
            margin: EdgeInsets.all(6),
            // padding: EdgeInsets.all(2),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  File('${widget.path}'),
                  fit: BoxFit.fill,
                )),
          ),
        ),
      ]),
    );
  }
}
