import 'package:flutter/material.dart';
import 'package:test_downloading_youtube/test.dart';
import 'package:test_downloading_youtube/Screens/mainScreen.dart';
import 'package:provider/provider.dart';
import 'package:test_downloading_youtube/Models/selectedItemscount.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      ChangeNotifierProvider(
        create: (context)=>SelectedItemCount(),
          child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

