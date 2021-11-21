import 'package:flutter/material.dart';
import 'package:whatsapp_status_saver/Models/savedStatusListModel.dart';
import 'package:whatsapp_status_saver/Utilities/DeviceData/deviceSize.dart';
import 'package:whatsapp_status_saver/Widgets/savedimagesView.dart';
import 'package:whatsapp_status_saver/Widgets/savedVideoGridView.dart';
import 'package:whatsapp_status_saver/Utilities/getSavedFiles.dart';
import 'package:provider/provider.dart';

class SavedStatus extends StatefulWidget {
  @override
  _SavedStatusState createState() => _SavedStatusState();
}

class _SavedStatusState extends State<SavedStatus> {
  void getDirectoryFiles() async {
    List<String> file = [];
    file = await getSavedStatusFiles();
    if (file.length !=
        Provider.of<SavedStatusListClass>(context, listen: false)
            .savedStatusFileList
            .length) {
      //prevent from giving savedStatusFile list a fixed length
      for (int i = Provider.of<SavedStatusListClass>(context, listen: false)
              .savedStatusFileList
              .length;
          i < file.length;
          i++) {
        Provider.of<SavedStatusListClass>(context, listen: false)
            .addFiles(file[i]);
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDirectoryFiles();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
              child: Consumer<SavedStatusListClass>(
                builder: (context, selectedItem, child) {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: Provider.of<SavedStatusListClass>(context,
                              listen: false)
                          .savedStatusFileList
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        return Provider.of<SavedStatusListClass>(context,
                                    listen: false)
                                .savedStatusFileList[index]
                                .toString()
                                .endsWith('.mp4')
                            ? SavedVideoGridView(
                                file: Provider.of<SavedStatusListClass>(context,
                                        listen: false)
                                    .savedStatusFileList,
                                index: index,
                                filePath:
                                    '${Provider.of<SavedStatusListClass>(context, listen: false).savedStatusFileList[index]}',
                              )
                            : SavedImagesGridView(
                                path:
                                    '${Provider.of<SavedStatusListClass>(context, listen: false).savedStatusFileList[index]}',
                                file: Provider.of<SavedStatusListClass>(context,
                                        listen: false)
                                    .savedStatusFileList,
                                index: index,
                              );
                      });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
