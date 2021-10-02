import 'package:flutter/material.dart';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'package:test_downloading_youtube/Widgets/VideoGridView.dart';
class VideoStatus extends StatefulWidget {
  List file;
  VideoStatus({required this.file});

  @override
  _VideoStatusState createState() => _VideoStatusState();
}

class _VideoStatusState extends State<VideoStatus> {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: DeviceHieght(context),
      width: DeviceWidth(context),
      child: Column(
        children: [
      Expanded(
            child: Container(
              child: GridView.builder
                (
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: widget.file.length,
                  itemBuilder:(BuildContext context, int index){
                    return VideoGridView(filePath: '${widget.file[index]}',file: widget.file,index: index,);//(lib/Widgets/VideoGridView)
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
