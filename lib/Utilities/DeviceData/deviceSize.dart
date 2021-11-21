import 'package:flutter/material.dart';

double DeviceHieght(BuildContext context) {
  double hieght = MediaQuery.of(context).size.height;
  print(hieght);
  //843.4285714285714
  return hieght;
}

double DeviceWidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  print(width);
  //411.42857142857144
  return width;
}
