import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../core/widgets/default_texts.dart';
import '../emp_details_screen.dart';

class BottomSheetEMPPhoneNumber extends StatelessWidget {
  const BottomSheetEMPPhoneNumber({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _makePhoneCall(widget.model.empPhoneNumber.toString());
      },
      child: TitleText(
        text: "رقم الهاتف: ${widget.model.empPhoneNumber!}",
       
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
