import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_downloading_youtube/Utilities/DeviceData/deviceSize.dart';
import 'package:test_downloading_youtube/Widgets/selectedImage.dart';
import 'package:share_plus/share_plus.dart';
import 'package:test_downloading_youtube/Utilities/GlobalVariables.dart';
import 'package:provider/provider.dart';
import 'package:test_downloading_youtube/Models/selectedItemscount.dart';
class SelectItem extends StatefulWidget {
  List file;
  int index;
  SelectItem({required this.file, required this.index});

  @override
  _SelectItemState createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  bool isSlected=false;
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init');
    if(imageList_shareddownloaded.contains('${widget.file[widget.index]}')==false){
      print('init2');
      setState(() {
        imageList_shareddownloaded.add('${widget.file[widget.index]}');
        Provider.of<SelectedItemCount>(context,listen: false).increase();
        print('listlength= ${imageList_shareddownloaded.length}');
      });

    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
    imageList_shareddownloaded.clear();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Container(
          height: DeviceHieght(context),
          width: DeviceWidth(context),
          // color: Colors.yellow,
          child: Column(
            children: [
              Container(
                height: 100/843.43*DeviceHieght(context),
                width: DeviceWidth(context),
                color: Color(0xff009688),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 30,),
                    ),
                  ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Consumer<SelectedItemCount>(
                        builder: (context,selectedItem,child){
                          return Text(
                                '${Provider.of<SelectedItemCount>(context,listen: false).count} Selected',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              );
                        },
                      ),
                      // child: Text(
                      //   '${Provider.of<SelectedItemCount>(context,listen: false).count}',
                      //   style: TextStyle(
                      //     fontSize: 20
                      //   ),
                      // ),
                    ),
                    SizedBox(width: (200/411.43)*DeviceWidth(context),),
                    GestureDetector(
                      onTap: (){
                        Share.shareFiles(imageList_shareddownloaded);
                      },
                      child: Container(
                        child: Icon(Icons.share_rounded,color: Colors.white,size: 30,),
                      ),
                    ),
                  ],
                ),
              ),
              // loader==true?CircularProgressIndicator():
              Expanded(
                child: Container(

                  // color: Colors.red,
                  child: GridView.builder
                    (
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemCount: widget.file.length,
                      itemBuilder:(BuildContext context, int index){
                        return widget.index==index?SelectedImage(path: '${widget.file[index]}',isSelected: true,):SelectedImage(path: '${widget.file[index]}',isSelected: false,);
                      }),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
