import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_downloading_youtube/Models/savedStatusListModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:media_scanner/media_scanner.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_downloading_youtube/Utilities/GlobalVariables.dart';

Future<void> DeleteFile(String filepath , BuildContext context)async{
  bool status = await Permission.storage.status.isDenied;

  if (status == true) {
    await Permission.storage.request();
  }
  final Dir =  Directory('/storage/emulated/0/DCIM/testApp');


// Path of file
  final myImagePath = '${Dir.path}/Picsdd';
  await Directory(filepath).delete(recursive: true);

  Provider.of<SavedStatusListClass>(context,listen: false).deleteFile(filepath);
  var load= await MediaScanner.loadMedia(path: '${myImagePath}');
  Fluttertoast.showToast(msg: 'Deleted',);

}