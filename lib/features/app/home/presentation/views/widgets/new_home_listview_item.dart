import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:worktopia/core/utils/app_routs.dart';

import '../../../../../../core/entities/department_model.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/default_texts.dart';

class NewHomeListViewItem extends StatelessWidget {
  const NewHomeListViewItem({
    super.key,
    required this.model,
  });

  final DepartmentsModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(
                    text: model.departmentName!,
                    titleColor: AppColor.navyColor,
                  ),
                  const SizedBox(height: 5),
                  TitleText(
                    text: model.departmentCompanyForNow!,
                    maxLine: 3,
                    isTitle: false,
                    subTitleSize: 18,
                    subTitleColor: AppColor.blackColor.withOpacity(.5),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextButton(
                  text: "تفاصيل العقد",
                  textColor: AppColor.redColor,
                  onPressed: () {
                    GoRouter.of(context)
                        .push(AppRouter.departmentDetiles, extra: model);
                  },
                ),
                const SizedBox(height: 8),
                CustomTextButton(
                  text: "مشاهدة العمالة",
                  textColor: AppColor.navyColor,
                  onPressed: () {
                    GoRouter.of(context)
                        .push(AppRouter.empScreen, extra: model);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textColor,
  });

  final VoidCallback onPressed;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: TitleText(
        text: text,
        subTitleSize: 14,
        isTitle: false,
        subTitleColor: textColor,
      ),
    );
  }
}
