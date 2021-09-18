import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:media_scanner/media_scanner.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> DeleteFile(String filepath)async{
  bool status = await Permission.storage.status.isDenied;

  if (status == true) {
    await Permission.storage.request();
  }
  final Dir =  Directory('/storage/emulated/0/DCIM/testApp');
  print('done');

// Path of file
  final myImagePath = '${Dir.path}/Picsdd';
  await Directory(filepath).delete(recursive: true);
  var load= await MediaScanner.loadMedia(path: '${myImagePath}');
  Fluttertoast.showToast(msg: 'Deleted',);

}