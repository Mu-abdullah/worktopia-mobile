import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.thickness = 2,
    this.color = AppColor.navyColor,
    this.endIndent = 20,
    this.indent = 20,
    this.veratical = false,
    this.vPaddingDouble = 0,
    this.hPaddingDouble = 0,
    this.opacity = 1,
  });
  final Color color;
  final double thickness;
  final double endIndent;
  final double indent;
  final bool veratical;
  final double vPaddingDouble;
  final double hPaddingDouble;
  final double opacity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hPaddingDouble,
        vertical: vPaddingDouble,
      ),
      child: veratical
          ? VerticalDivider(
              color: color.withOpacity(opacity),
              endIndent: endIndent,
              indent: indent,
              thickness: thickness,
            )
          : Divider(
              color: color.withOpacity(opacity),
              endIndent: endIndent,
              indent: indent,
              thickness: thickness,
            ),
    );
  }
}
