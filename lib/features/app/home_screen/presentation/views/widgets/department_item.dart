import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_routs.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/utils/size.dart';
import '../../../../../../core/utils/tables_name.dart';
import '../../../../../../core/widgets/default_texts.dart';
import '../../../data/model/department_button_model.dart';

class DepartmentItem extends StatefulWidget {
  const DepartmentItem({
    super.key,
    required this.model,
  });
  final DepartmentsButtonModel model;

  @override
  State<DepartmentItem> createState() => _DepartmentItemState();
}

class _DepartmentItemState extends State<DepartmentItem> {
  late String name = "";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.empScreen, extra: widget.model.departmentName);
      },
      child: Container(
        width:kIsWeb? MediaQuery.of(context).size.width/5.2 :CustomSize.width(context, 0.35),
        decoration: BoxDecoration(
          color: AppColor.babyBlueColor,
          borderRadius: BorderRadius.circular(Constant.radius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(kIsWeb?0 :4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.model.departmentIcon,
                size: 48,
                color: AppColor.navyColor,
              ),
              const SizedBox(height: 15),
              Center(
                child: TitleText(
                  isTitle: false,
                  text: buffet(),
                  maxLine: 1,
                  subTitleColor: AppColor.navyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String buffet() {
    return widget.model.departmentName == TableName.buffet
        ? name = "البوفية"
        : widget.model.departmentName!;
  }
}
