import 'package:flutter/material.dart';
import 'package:worktopia/core/widgets/image_preview.dart';

import '../../../../../../../core/utils/colors.dart';
import '../emp_bottom_sheet.dart';

class BottomSheetEMPImage extends StatelessWidget {
  const BottomSheetEMPImage({
    super.key,
    required this.widget,
  });

  final EmpBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // widget.model.empImage)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImagePreviewScreen(
              imageTitle: widget.model.empName!,
              imageUrl: widget.model.empImage!,
            ),
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: CircleAvatar(
          maxRadius: 105,
          minRadius: 100,
          backgroundColor: AppColor.yellowColor,
          child: CircleAvatar(
            maxRadius: 100,
            minRadius: 49,
            backgroundImage: NetworkImage(
              widget.model.empImage!,
            ),
          ),
        ),
      ),
    );
  }
}
