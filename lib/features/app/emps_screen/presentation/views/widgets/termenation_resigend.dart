import 'package:flutter/material.dart';

import '../../../../../../core/widgets/default_texts.dart';
import 'emp_details_screen.dart';

class ResigendAndTerminationInfo extends StatelessWidget {
  const ResigendAndTerminationInfo({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleText(
          text: "تاريخ نهاية العمل: ${widget.model.endJob}",
          
          isTitle: false,
        ),
        const SizedBox(height: 15),
        TitleText(
          text: "سبب انهاء العمل: ${widget.model.endJobReaseon!}",
        
          isTitle: false,
        ),
      ],
    );
  }
}
