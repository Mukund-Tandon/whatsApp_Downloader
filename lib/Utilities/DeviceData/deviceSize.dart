import 'package:flutter/material.dart';
double DeviceHieght(BuildContext context){
  double hieght = MediaQuery.of(context).size.height;
  // print(hieght);
  return hieght;
}
double DeviceWidth(BuildContext context){
  double width = MediaQuery.of(context).size.width;
  // print(width);
  return width;
}