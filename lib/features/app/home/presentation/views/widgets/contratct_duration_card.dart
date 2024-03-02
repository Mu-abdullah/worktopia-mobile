import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/default_texts.dart';
import 'departmets_detailes.dart';

class ContarctDuration extends StatelessWidget {
  const ContarctDuration({
    super.key,
    required this.widget,
  });

  final DepartmentDetilesScreen widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TitleText(
              text: "مدة العقد",
              isTitle: false,
              subTitleColor: Colors.white,
            ),
            const SizedBox(height: 5),
            TitleText(
              text: "بداية العقد: ${widget.model.departmentCompanyStartIn!}",
              maxLine: 2,
              isTitle: false,
              subTitleColor: AppColor.whiteColor,
            ),
            const SizedBox(height: 10),
            TitleText(
              text: "نهاية العقد: ${widget.model.departmentCompanyEndIn!}",
              maxLine: 2,
              subTitleColor: AppColor.whiteColor,
              isTitle: false,
            ),
          ],
        ),
      ),
    );
  }
}
