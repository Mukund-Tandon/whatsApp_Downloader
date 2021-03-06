import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_status_saver/Utilities/GlobalVariables.dart';
import 'package:whatsapp_status_saver/Utilities/getSavedFiles.dart';

class SavedStatusListClass extends ChangeNotifier {
  // List<String> savedStatusFileList;
  List<String> savedStatusFileList = [];
  // void update(){
  //   localList = savedStatusFileList;
  //   notifyListeners();
  // }
  void addFiles(String filepath) {
    savedStatusFileList.add(filepath);
    notifyListeners();
  }

  void deleteFile(String filepath) {
    savedStatusFileList.remove(filepath);
    notifyListeners();
  }

  void addFileList(List<String> fileList) {
    savedStatusFileList = fileList;
    notifyListeners();
  }
}
