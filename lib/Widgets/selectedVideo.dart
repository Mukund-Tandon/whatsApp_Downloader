import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'package:test_downloading_youtube/Models/selectedItemscount.dart';
import 'package:test_downloading_youtube/Utilities/GlobalVariables.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:test_downloading_youtube/Screens/VideoView.dart';
class SelectedVideo extends StatefulWidget {
  String path;
  int index;
  List file;

  SelectedVideo({ required this.path, required this.index, required this.file});

  @override
  _SelectedVideoState createState() => _SelectedVideoState();
}

class _SelectedVideoState extends State<SelectedVideo> {
  bool isSelected = false;
  late VideoPlayerController controller;
  void doInitialTask()async{
    controller = VideoPlayerController.file(File('${widget.path}'));
    await controller.initialize();
    WidgetsBinding.instance!.addPostFrameCallback((_){
      if(widget.file[widget.index]==widget.path) {

        imageList_shareddownloaded.add('${widget.file[widget.index]}');

        Provider.of<SelectedItemCount>(context, listen: false).increase();
        setState(() {
          isSelected = true;
        });
      }
      else{
        isSelected = false;
      }
    });

  }
  void toogleSelected(){


    isSelected= !isSelected;
    if(isSelected==true){
      setState(() {
        imageList_shareddownloaded.add('${widget.path}');
        Provider.of<SelectedItemCount>(context,listen: false).increase();
        print(imageList_shareddownloaded.length);
      });

    }
    else{
      setState(() {
        imageList_shareddownloaded.remove('${widget.path}');
        Provider.of<SelectedItemCount>(context,listen: false).decrease();
        print(imageList_shareddownloaded.length);
      });

    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doInitialTask();}

  @override
  Widget build(BuildContext context) {
    double Containerheight= (130/843.43)*DeviceHieght(context);
    double Containerwidth= (130/411.43)*DeviceWidth(context);
    return Container(
      height: Containerheight,
      width: Containerwidth,
      alignment: Alignment.center,
      margin: EdgeInsets.all(0),
      // color: Colors.pink,

      child: Stack(
        // alignment: Alignment.center,
        //   fit: StackFit.expand,
          children: [
            Container(
              height:Containerheight,
              width:Containerwidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),

              ),
              alignment: Alignment.center,
              // color: Colors.black54,
              margin:isSelected? EdgeInsets.all(6):EdgeInsets.all(0),

              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: controller.value.isInitialized?VideoPlayer(controller):CircularProgressIndicator()),
            ),
            GestureDetector(
              onTap: (){
                toogleSelected();
              },
              child: Container(
                height:Containerheight,
                width:Containerwidth,
                margin:isSelected==true? EdgeInsets.all(6):EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color:isSelected? Colors.black54.withOpacity(.5):Colors.transparent,
                ),
                child: Container(
                  child: Icon(
                    Icons.check,
                    color:isSelected? Colors.white:Colors.transparent,
                    size: 40,
                  ),
                ),
              ),
            ),
            Positioned(
              left: .75*Containerwidth,
              top: .75*Containerheight,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoView(path: widget.path,isSaved: true,)));
                },
                child: Container(
                  height: Containerheight*.2,
                  width:  Containerwidth*.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.black26.withOpacity(.6),
                  ),
                  child: Icon(Icons.open_in_full_rounded,color: Colors.white,size: 15,),
                ),
              ),
            )
          ]
      ),
    );
  }
}