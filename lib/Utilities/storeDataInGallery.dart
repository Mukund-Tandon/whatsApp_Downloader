import 'package:media_scanner/media_scanner.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

void create_directory(String filepath)async {
  bool status = await Permission.storage.status.isDenied;
  int index = filepath.indexOf('.Statuses')+10;//unique file name after .statuses
  if (status == true) {
    await Permission.storage.request();
  }

  File image = File('$filepath');

  final extDir = await Directory('/storage/emulated/0/DCIM/testApp').create(recursive: true);


// Path of file
  final myImagePath = '${extDir.path}/Picsdd';//folder where images and videos will be stored in gallery


// Create directory inside where file will be saved
  await new Directory(myImagePath).create();



// File copied to ext directory.
  File newImage =
  await image.copy("$myImagePath/${filepath.substring(index)}");
  var load= await MediaScanner.loadMedia(path: '${myImagePath}');//notify gallery the new file is added
  Fluttertoast.showToast(msg: 'Saved',);

}
