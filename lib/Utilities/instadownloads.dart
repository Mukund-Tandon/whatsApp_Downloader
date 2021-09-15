import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
Future<String> getData(String url)async{
  int index= url.indexOf("?utm_medium");
  print(index);
  String final_url= url.substring(0,index)+"?__a=1";
  print(final_url);
  http.Response response = await http.get(Uri.parse('$final_url'));
  String data = response.body;
  var jsonData= jsonDecode(data);
  String srcUrl= jsonData["graphql"]["shortcode_media"]["video_url"];
  print(srcUrl);
     return srcUrl;
}
// http.Response response=await http.get(Uri.parse(url));
// if(response.statusCode==200)
// {
// String data = response.body;
// return jsonDecode(data);
// }
// else{
// print("no");
// print(response.statusCode);
// }