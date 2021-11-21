import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_status_saver/Utilities/DeviceData/deviceSize.dart';
import 'package:whatsapp_status_saver/Screens/mainScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
  void sharedpref() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('opened', 'true');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xbf00a698),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: (300 / 411.43) * DeviceWidth(context),
                height: (250 / 843.43) * DeviceHieght(context),
                decoration: BoxDecoration(
                    color: Color(0xff009688),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: (5 / 411.43) * DeviceWidth(context),
                        blurRadius: (2 / 411.43) * DeviceWidth(context),
                        color: Colors.white60.withOpacity(0.3),
                      )
                    ]),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        'Important',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Concert'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        '- To save a status you must first view the status in WhatsApp',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Concert'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        '- If status not visible on this App then close and restart this App',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Concert'),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextButton(
                      onPressed: () {
                        sharedpref();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      },
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius:
                                    (5 / 411.43) * DeviceWidth(context),
                                blurRadius: (2 / 411.43) * DeviceWidth(context),
                                color: Colors.white60.withOpacity(0.3),
                              )
                            ]),
                        child: Center(
                          child: Text(
                            'Got It',
                            style: TextStyle(
                                color: Color(0xff009688), fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
