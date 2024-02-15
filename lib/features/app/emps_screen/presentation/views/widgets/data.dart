import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/entites/department_model.dart';
import '../../../../../../core/utils/app_routs.dart';
import '../../../../../../core/widgets/default_texts.dart';

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
          GoRouter.of(context).push(AppRouter.departmentDetiles, extra: model);
          // showModalBottomSheet(
          //   context: context,
          //   shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.vertical(
          //       top: Radius.circular(20),
          //     ),
          //   ),
          //   isScrollControlled: true,
          //   clipBehavior: Clip.antiAliasWithSaveLayer,
          //   builder: (context) => DepartmentDetilesBotttomSheet(
          //     model: model,
          //   ),
          // );
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
