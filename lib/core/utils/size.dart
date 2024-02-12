import 'package:flutter/material.dart';

class CustomSize {
 static double height(BuildContext context, double size) {
    return MediaQuery.of(context).size.height * size;
  }

static  double width(BuildContext context, double size) {
    return MediaQuery.of(context).size.width * size;
  }
}
