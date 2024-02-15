import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:worktopia/core/utils/app_routs.dart';

import '../../../../../../core/entites/department_model.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/default_texts.dart';

class CompanyItem extends StatelessWidget {
  const CompanyItem({
    super.key,
    required this.model,
  });
  final DepartmentsModel model;
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      title: TitleText(
        text: model.departmentCompanyForNow!,
        maxLine: 2,
      ),
      subtitle: TitleText(
        text: model.departmentName!,
        isTitle: false,
        subTitleColor: AppColor.blackColor.withOpacity(.5),
      ),
    );
  }
}
