import 'package:flutter/services.dart';
import 'package:media_scanner/media_scanner.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:flutter/material.dart';

void create_directory(String filepath)async {
  bool status = await Permission.storage.status.isDenied;
  print(status);
  int index = filepath.indexOf('.Statuses')+11;
  if (status == true) {
    await Permission.storage.request();
  }
  print('done');
  File image = File('$filepath');
  // File image = await getImageFileFromFilePah(filepath);
  print(image.path);
  Directory? d=await getExternalStorageDirectory();
  print(d!.path);
  final extDir = await Directory('/storage/emulated/0/DCIM/testApp').create(recursive: true);
  print('done');

// Path of file
  final myImagePath = '${extDir.path}/Picsdd';
  print('done');

// Create directory inside where file will be saved
  await new Directory(myImagePath).create();
  print('d');
  // final filename= p.basename(filepath);
  print('done');
// File copied to ext directory.
  File newImage =
  await image.copy("$myImagePath/${filepath.substring(index)}");
  var load= await MediaScanner.loadMedia(path: '${myImagePath}');
  print(newImage.path);

}
// Future<File> getImageFileFromFilePah(String filePath) async {
//   // var data= await http.get(Uri.parse(url));
//   File data = Image.file(File('$filePath'));
//   // List<int> imageBytes = await data;
//   String filename;
//   if(filePath.endsWith('.jpg')){
//     filename = 'img.jpg';
//   }
//   else{
//     filename= 'vid.mp4';
//   }
//   final file = await File('${(await getApplicationDocumentsDirectory()).path}/$filename')
//       .create(recursive: true);
//   await file.writeAsBytes(data);
//
//   return file;
// }