import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_routs.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/default_texts.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        GoRouter.of(context).push(AppRouter.newEmpScreen);
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.navyColor,
            borderRadius: BorderRadius.circular(Constant.radius)),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: TitleText(
            text: "اضافة عامل",
            titleColor: AppColor.whiteColor,
          ),
        ),
      ),
    );
  }
}
