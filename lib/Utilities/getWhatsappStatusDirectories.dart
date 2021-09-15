import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<List> getWhatsAppStatusFiles()async{
  bool status1 = await Permission.manageExternalStorage.isDenied;
  bool status2 = await Permission.storage.isDenied;
  if (status1 == true || status2 ==true) {
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }
  // print('2');
  List file= [];
  print('2');
  var d=await getExternalStorageDirectory();
  print(d!.path);
  var completer = new Completer();
  Directory s= Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');
  bool dirExist= await s.exists();
  if(dirExist==false){
    s = Directory('/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses');
  }
  file=  s.listSync().map((item) => item.path).where((
      item) => item.endsWith(".nomedia")==false).toList(growable: false);


  print('2');
  return file;
}