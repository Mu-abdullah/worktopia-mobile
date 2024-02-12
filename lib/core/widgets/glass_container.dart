import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/colors.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.widget,
    this.raduis = 25,
  });
  final Widget widget;
  final double raduis;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(raduis),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(raduis),
                  color: Colors.grey.shade200.withOpacity(0.1),
                  border: Border.all(
                    color: AppColor.navyColor.withOpacity(.2),
                  ),
                ),
                child: widget),
          ),
        ),
      ),
    );
  }
}
