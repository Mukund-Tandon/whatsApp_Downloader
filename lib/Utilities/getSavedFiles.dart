import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

Future<List<String>> getSavedStatusFiles()async{
  bool status1 = await Permission.manageExternalStorage.isDenied;
  bool status2 = await Permission.storage.isDenied;
  if (status1 == true || status2 ==true) {
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }
  // print('2');
  List<String> file= [];
  
  Directory s= Directory('/storage/emulated/0/DCIM/testApp/Picsdd');
  
  file=  s.listSync().map((item) => item.path).where((
      item) => item.endsWith(".nomedia")==false).toList(growable: false);



  return file;
}