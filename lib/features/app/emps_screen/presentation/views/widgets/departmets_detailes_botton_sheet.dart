import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/entites/department_model.dart';
import '../../../../../../core/utils/app_routs.dart';
import '../../../../../../core/utils/size.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/default_texts.dart';
import '../../../../../../core/widgets/divider.dart';
import 'company_info.dart';

class DepartmentDetilesBotttomSheet extends StatefulWidget {
  const DepartmentDetilesBotttomSheet({
    super.key,
    required this.model,
  });

  final DepartmentsModel model;

  @override
  State<DepartmentDetilesBotttomSheet> createState() =>
      _DepartmentDetilesBotttomSheetState();
}

class _DepartmentDetilesBotttomSheetState
    extends State<DepartmentDetilesBotttomSheet> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleText(
            text: widget.model.departmentCompanyForNow!,
            maxLine: 3,
          ),
          const SizedBox(height: 5),
          CustomDivider(
            indent: 0,
            endIndent: CustomSize.width(context, .35),
          ),
          const TitleText(text: "مدة العقد"),
          const SizedBox(height: 5),
          TitleText(
            text: "بداية العقد: ${widget.model.departmentCompanyStartIn!}",
            maxLine: 2,
            isTitle: false,
          ),
          const SizedBox(height: 10),
          TitleText(
            text: "نهاية العقد: ${widget.model.departmentCompanyEndIn!}",
            maxLine: 2,
            isTitle: false,
          ),
          CompanyInfo(widget: widget),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomButton(
                  onPress: () {
                    Navigator.pop(context);
                  },
                  buttonName: "إغلاق",
                  needIcon: true,
                  icon: kIsWeb ? Icons.close : Iconsax.close_square,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 1,
                child: CustomButton(
                  onPress: () {
                    Navigator.pop(context);
                    GoRouter.of(context).push(AppRouter.editeDepartmentScreen,
                        extra: widget.model);
                  },
                  buttonName: "تعديل",
                  needBorder: true,
                  needIcon: true,
                  icon: kIsWeb ? Icons.edit : Iconsax.edit,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
