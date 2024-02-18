import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_bottom_sheet.dart';

class BottomSheetEMPPhoneNumber extends StatelessWidget {
  const BottomSheetEMPPhoneNumber({
    super.key,
    required this.widget,
  });

  final EmpBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _makePhoneCall(widget.model.empPhoneNumber.toString());
      },
      child: TitleText(
        text: "رقم الهاتف: ${widget.model.empPhoneNumber!}",
        subTitleColor: AppColor.blackColor.withOpacity(.7),
        isTitle: false,
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
