import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/default_texts.dart';
import '../../manger/department_cubit/department_cubit.dart';
import '../../manger/department_cubit/department_state.dart';

class CompaniesDropMenu extends StatelessWidget {
  const CompaniesDropMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentCubit, DepartmentState>(
      builder: (context, state) {
        DepartmentCubit cubit = DepartmentCubit.get(context);
        if (state is CompaniesLoaded) {
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: DropdownButton(
                  alignment: Alignment.center,
                  isExpanded: true,
                  value: cubit.companyValue,
                  hint: Center(
                    child: TitleText(
                      text: "الشركة المسند إليها العقد",
                      isTitle: false,
                      subTitleColor: cubit.companyValue == null
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
                  items: state.companiesNames.map((String items) {
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
                            isTitle: false,
                            subTitleSize: 14,
                            maxLine: 3,
                          ),
                        ),
                      ),
                    );
                  }).toList(),

                  onChanged: (String? newValue) {
                    cubit.changeSelectedDocument(newValue);
                  },
                ),
              ),
            ],
          );
        } else if (state is CompaniesError) {
          return TitleText(text: "خطا في تحميل الشركات ${state.errorMessage}");
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.transparent,
            ),
          );
        }
      },
    );
  }
}
