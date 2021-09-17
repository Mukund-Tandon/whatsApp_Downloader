import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:test_downloading_youtube/Utilities/GlobalVariables.dart';
class SelectedItemCount extends ChangeNotifier{
  int count = imageList_shareddownloaded.length;
  void increase(){
    count=imageList_shareddownloaded.length;
    print('count=$count');
    notifyListeners();
  }
  void decrease(){
    count=imageList_shareddownloaded.length;
    print('count=$count');
    notifyListeners();
  }

}