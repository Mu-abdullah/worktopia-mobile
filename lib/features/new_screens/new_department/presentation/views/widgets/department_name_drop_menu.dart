import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/utils/tables_name.dart';
import '../../../../../../core/widgets/default_texts.dart';
import '../../manger/department_cubit/department_cubit.dart';
import '../../manger/department_cubit/department_state.dart';

class DepartNameDropMenu extends StatefulWidget {
  const DepartNameDropMenu({super.key});

  @override
  State<DepartNameDropMenu> createState() => _DepartNameDropMenuState();
}

class _DepartNameDropMenuState extends State<DepartNameDropMenu> {
  // String? departmentName;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentCubit, DepartmentState>(
      builder: (context, state) {
        DepartmentCubit cubit = DepartmentCubit.get(context);
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: DropdownButton(
                alignment: Alignment.center,
                isExpanded: true,
                value: cubit.departmentName,
                hint: Center(
                  child: TitleText(
                    text: "الاقسام",
                    isTitle: true,
                    titleColor: cubit.departmentName == null
                        ? AppColor.blackColor.withOpacity(.5)
                        : AppColor.whiteColor,
                  ),
                ),
                underline: Container(
                  color: AppColor.whiteColor,
                ),
                // Down Arrow Icon
                icon: const Icon(
                  Iconsax.arrow_circle_down,
                  color: AppColor.navyColor,
                ),
                borderRadius: BorderRadius.circular(Constant.radius),
                // Array list of items
                items: departmentsItems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Constant.radius,
                          ),
                          color: AppColor.yellowColor.withOpacity(.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TitleText(
                          text: items,
                        ),
                      ),
                    ),
                  );
                }).toList(),

                onChanged: (String? newValue) {
                  setState(() {
                    // departmentName = newValue;
                    cubit.departmentName = newValue;
                  });
                },
              ),
            ),
          ],
        );
      },
    );
  }

  List<String> departmentsItems = [
    TableName.supplyEmp,
    TableName.clean,
    TableName.buffet,
    TableName.farm,
    TableName.reeds,
  ];
}
