import 'package:flutter/material.dart';
import 'package:test_downloading_youtube/test.dart';
import 'package:test_downloading_youtube/Screens/mainScreen.dart';
import 'package:provider/provider.dart';
import 'package:test_downloading_youtube/Models/selectedItemscount.dart';
import 'package:test_downloading_youtube/Models/savedStatusListModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_downloading_youtube/Screens/first_screen.dart';

Future<int> sharedpref() async {
  int option = 1;
  final prefs = await SharedPreferences.getInstance();
  print('done');
  String? opened = prefs.getString('opened');
  print('done');
  if (opened == 'true') {
    print('done');
    option = 2;
  } else if (opened == null) {
    print('done2');
    option = 1;
  }
  return option;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  int option = await sharedpref();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SelectedItemCount()),
        ChangeNotifierProvider(create: (context) => SavedStatusListClass()),
      ],
      child: MyApp(
        option: option,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  int option;
  MyApp({this.option = 1});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: option == 1 ? FirstScreen() : MainScreen(),
    );
  }
}
