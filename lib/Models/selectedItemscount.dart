import 'package:flutter/foundation.dart';

import 'package:whatsapp_status_saver/Utilities/GlobalVariables.dart';

class SelectedItemCount extends ChangeNotifier {
  int count = imageList_shareddownloaded.length;
  void increase() {
    count = imageList_shareddownloaded.length;
    print('count=$count');
    notifyListeners();
  }

  void decrease() {
    count = imageList_shareddownloaded.length;
    print('count=$count');
    notifyListeners();
  }
}
