import 'package:flutter/material.dart';

import '../../../../emps_screen/presentation/views/widgets/company_info.dart';
import 'company_card.dart';
import 'contratct_duration_card.dart';
import 'departmets_detailes.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({
    super.key,
    required this.widget,
  });

  final DepartmentDetilesScreen widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CompanyCard(widget: widget),
            ContarctDuration(widget: widget),
            CompanyInfo(widget: widget),
          ],
        ),
      ),
    );
  }
}
