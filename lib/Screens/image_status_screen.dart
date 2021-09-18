import 'package:flutter/material.dart';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'package:test_downloading_youtube/Widgets/ImageGridView.dart';
class ImageStatus extends StatefulWidget {
List file;
ImageStatus({required this.file});

  @override
  _ImageStatusState createState() => _ImageStatusState();
}

class _ImageStatusState extends State<ImageStatus> {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: DeviceHieght(context),
      width: DeviceWidth(context),
      // color: Colors.yellow,
      child: Column(
        children: [
      Expanded(
            child: Container(
              // color: Colors.red,
              child: GridView.builder
                (
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: widget.file.length,
                  itemBuilder:(BuildContext context, int index){
                    return ImageGridView(path: '${widget.file[index]}',file: widget.file,index: index,);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
