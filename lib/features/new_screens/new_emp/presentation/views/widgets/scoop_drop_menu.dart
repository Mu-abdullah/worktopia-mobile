import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/default_texts.dart';
import '../../../../new_emp/presentation/manger/new_emp_cubit/new_emp_cubit.dart';

class ChooseScoop extends StatelessWidget {
  const ChooseScoop({
    super.key,
    required this.cubit,
  });

  final NewEmpCubit cubit;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: cubit.scoopValue,
      hint: Center(
        child: TitleText(
          text: "التخصص",
          isTitle: false,
          subTitleSize: 16,
          subTitleColor: cubit.scoopValue == null
              ? AppColor.blackColor.withOpacity(.5)
              : AppColor.whiteColor,
        ),
      ),
      underline: Container(
        color: AppColor.whiteColor,
      ),
      // Down Arrow Icon
      icon: const Icon(
        kIsWeb ? Icons.keyboard_arrow_down_rounded : Iconsax.arrow_circle_down,
        color: AppColor.navyColor,
      ),
      borderRadius: BorderRadius.circular(Constant.radius),
      // Array list of items
      items: cubit.departmentAndScoops().map((String items) {
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

      onChanged: (String? newValue) {
        cubit.changeScoop(newValue);
      },
    );
  }
}
