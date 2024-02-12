import 'package:flutter/material.dart';

class DrawerModel {
  final String? buttonName;
  final IconData? leading;
  final IconData? trailing;
  final Function()? onTap;

  DrawerModel({
    this.buttonName,
    this.leading,
    this.trailing,
    this.onTap,
  });
}
