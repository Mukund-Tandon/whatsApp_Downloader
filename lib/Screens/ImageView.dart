import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_status_saver/Utilities/DeviceData/deviceSize.dart';
import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:whatsapp_status_saver/Utilities/storeDataInGallery.dart';
import 'package:whatsapp_status_saver/Utilities/deletefile.dart';

class ImageView extends StatefulWidget {
  String path;
  bool isSaved;
  ImageView({required this.path, required this.isSaved});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  List<String> Imagefilepath = [];
  void setPath() {
    Imagefilepath.add(widget.path);
  }

  void deleteFile() async {
    await DeleteFile(widget.path, context);

    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPath();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.black,
            height: DeviceHieght(context),
            width: DeviceWidth(context),
            child: Column(
              children: [
                Container(
                  height: 50,
                  margin: EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widget.isSaved
                          ? Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Container(
                                            height: 120,
                                            width: 200,
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Remove this from Saved?',
                                                    maxLines: 2,
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 7),
                                                  height: 70,
                                                  alignment: Alignment.center,
                                                ),
                                                Container(
                                                  child: Divider(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 20),
                                                  height: 30,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child: TextButton(
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .blueAccent,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: (85 / 411.43) *
                                                            DeviceWidth(
                                                                context),
                                                      ),
                                                      Container(
                                                        child: TextButton(
                                                          child: Text(
                                                            'Delete',
                                                            style: TextStyle(
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            deleteFile(); //(lib/Utilities/deleteFile.dart)
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      barrierDismissible: false);
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  margin: EdgeInsets.all(10),
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            )
                          : Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                              child: InkWell(
                                onTap: () {
                                  create_directory(widget.path);
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.download_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  margin: EdgeInsets.all(10),
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          onTap: () {
                            Share.shareFiles(Imagefilepath);
                          },
                          child: Container(
                            child: Icon(
                              Icons.share_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            margin: EdgeInsets.all(10),
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  child: InteractiveViewer(
                    child: Container(
                      child: Image.file(File('${widget.path}')),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
