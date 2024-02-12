import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/default_texts.dart';
import '../../../../new_emp/presentation/manger/new_emp_cubit/new_emp_cubit.dart';

class ChooseDepartment extends StatelessWidget {
  const ChooseDepartment({
    super.key,
    required this.cubit,
  });

  final NewEmpCubit cubit;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: cubit.departmentValue,
      hint: Center(
        child: TitleText(
          text: "القسم",
          isTitle: false,
          subTitleSize: 16,
          subTitleColor: cubit.departmentValue == null
              ? AppColor.blackColor.withOpacity(.5)
              : AppColor.whiteColor,
        ),
      ),
      // Down Arrow Icon
      icon: const Icon(
        kIsWeb ? Icons.keyboard_arrow_down_rounded : Iconsax.arrow_circle_down,
        color: AppColor.navyColor,
      ),
      underline: Container(
        color: AppColor.whiteColor,
      ),
      borderRadius: BorderRadius.circular(Constant.radius),
      // Array list of items
      items: cubit.department.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: TitleText(
              text: items,
              subTitleSize: 14,
              isTitle: false,
            ),
          ),
        );
      }).toList(),
      onTap: () {
        if (cubit.scoopValue != null) {
          cubit.scoopValue = null;
        }
      },
      onChanged: (String? newValue) {
        cubit.changeDepartment(newValue);
      },
    );
  }
}
