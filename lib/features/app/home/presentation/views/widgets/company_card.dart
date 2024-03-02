import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/default_texts.dart';
import 'departmets_detailes.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({
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
            TitleText(
              text: widget.model.departmentName!,
              isTitle: false,
              subTitleColor: Colors.white,
            ),
            const SizedBox(height: 5),
            TitleText(
              text: widget.model.departmentCompanyForNow!,
              maxLine: 3,
              titleColor: AppColor.whiteColor,
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}