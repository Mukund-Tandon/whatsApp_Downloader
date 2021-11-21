import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_status_saver/Utilities/DeviceData/deviceSize.dart';
import 'package:whatsapp_status_saver/Widgets/VideoGridView.dart';

class VideoStatus extends StatefulWidget {
  List file;
  VideoStatus({required this.file});

  @override
  _VideoStatusState createState() => _VideoStatusState();
}

class _VideoStatusState extends State<VideoStatus> {
  bool checkIfEmpty() {
    if (widget.file.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DeviceHieght(context),
      width: DeviceWidth(context),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: checkIfEmpty() == false
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: widget.file.length,
                      itemBuilder: (BuildContext context, int index) {
                        return VideoGridView(
                          filePath: '${widget.file[index]}',
                          file: widget.file,
                          index: index,
                        ); //(lib/Widgets/VideoGridView)
                      })
                  : Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'images/undraw_mobile_app_re_catg.svg',
                              height: (150 / 843.43) * DeviceHieght(context),
                              width: (90 / 411.43) * DeviceWidth(context),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                'Nothing to show :(',
                                style: TextStyle(
                                  color: Color(0xff009688),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                'For Status to appear here close this app and view the status on your WhatsApp ',
                                style: TextStyle(
                                  color: Color(0xcf009688),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
