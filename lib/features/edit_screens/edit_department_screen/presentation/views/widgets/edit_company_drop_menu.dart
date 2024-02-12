import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/utils/size.dart';
import '../../../../../../core/widgets/default_texts.dart';
import '../../manger/cubit/edit_department_cubit.dart';
import '../../manger/cubit/edit_department_state.dart';

class EditCompaniesDropMenu extends StatelessWidget {
  const EditCompaniesDropMenu({
    super.key,
    required this.company,
  });

  final String company;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditDepartmentCubit, EditDepartmentState>(
      builder: (context, state) {
        EditDepartmentCubit cubit = EditDepartmentCubit.get(context);
        if (state is CompaniesLoaded) {
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: DropdownButton(
                  menuMaxHeight: CustomSize.height(context, .3),
                  alignment: Alignment.center,
                  isExpanded: true,
                  value: cubit.companyValue,
                  hint: Center(
                    child: TitleText(
                      text: company,
                      isTitle: false,
                      subTitleSize: 14,
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
                    kIsWeb
                        ? Icons.keyboard_arrow_down_outlined
                        : Iconsax.arrow_circle_down,
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
