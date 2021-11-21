import 'package:flutter/material.dart';
import 'package:whatsapp_status_saver/Utilities/DeviceData/deviceSize.dart';
import 'package:whatsapp_status_saver/Widgets/ImageGridView.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageStatus extends StatefulWidget {
  List file; //image file recieved from mainScreen
  ImageStatus({required this.file});

  @override
  _ImageStatusState createState() => _ImageStatusState();
}

class _ImageStatusState extends State<ImageStatus> {
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
                        return ImageGridView(
                          path: '${widget.file[index]}',
                          file: widget.file,
                          index: index,
                        ); //(lib/Widgets/ImageGridView.dart)
                      })
                  : Center(
                      child: Container(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                                'images/undraw_mobile_app_re_catg.svg'),
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
