import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

Future<List> getWhatsAppStatusFiles(BuildContext context) async {
  // bool status1 = await Permission.manageExternalStorage.isDenied;
  bool status2 = await Permission.storage.isDenied;
  if (status2 == true) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Container(),
        );
      },
    );
    await Permission.storage.request();
    // await Permission.manageExternalStorage.request();
  }
  // if (status1 == true || status2 ==true) {
  //   await Permission.storage.request();
  //   await Permission.manageExternalStorage.request();
  // }
  List file = [];

  Directory s = Directory(
      '/storage/emulated/0/WhatsApp/Media/.Statuses'); //possible directory 1
  bool dirExist = await s.exists();
  if (dirExist == false) {
    s = Directory(
        '/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses'); //possible directory 2
  }
  file = s
      .listSync()
      .map((item) => item.path)
      .where((item) => item.endsWith(".nomedia") == false)
      .toList(growable: false);

  return file;
}
