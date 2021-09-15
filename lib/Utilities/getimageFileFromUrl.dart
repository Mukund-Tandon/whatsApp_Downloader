import 'package:flutter/services.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<File> getImageFileFromUrl(String url) async {
  var data= await http.get(Uri.parse(url));


  final file = await File('${(await getApplicationDocumentsDirectory()).path}/img.mp4')
      .create(recursive: true);
  await file.writeAsBytes(data.bodyBytes);

  return file;
}