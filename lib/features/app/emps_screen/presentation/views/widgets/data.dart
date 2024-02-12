import 'package:flutter/material.dart';

import '../../../../../../core/entites/department_model.dart';
import '../../../../../../core/widgets/default_texts.dart';
import 'departmets_detailes_botton_sheet.dart';

class DepartmentsData extends StatelessWidget {
  const DepartmentsData({
    super.key,
    required this.model,
    required this.scoop,
  });
  final DepartmentsModel model;
  final String scoop;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            isScrollControlled: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (context) => DepartmentDetilesBotttomSheet(
              model: model,
            ),
          );
        },
        child: TitleText(
          text: "$scoop : ${model.departmentCompanyForNow}",
          maxLine: 3,
          titleSize: 18,
        ),
      ),
    );
  }

  
}
