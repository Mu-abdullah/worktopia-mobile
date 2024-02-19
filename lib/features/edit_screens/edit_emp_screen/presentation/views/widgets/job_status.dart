import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/helper/firebase_names.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/widgets/default_texts.dart';
import '../../manger/cubit/edit_emp_cubit.dart';
import '../../manger/cubit/edit_emp_state.dart';

class JobStatus extends StatelessWidget {
  const JobStatus({
    super.key,
    required this.cubit,
    required this.jobStatus,
  });
  final String jobStatus;
  final EditEmpCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditEmpCubit, EditEmpState>(
      builder: (context, state) {
        EditEmpCubit cubit = EditEmpCubit.get(context);
        return SizedBox(
          height: 50,
          child: Row(
            children: [
              const TitleText(
                text: "حالة العمل",
                isTitle: false,
              ),
              const Spacer(),
              Expanded(
                child: DropdownButton(
                  value: cubit.jobStatus,
                  alignment: Alignment.center,
                  isExpanded: true,
                  hint: Center(
                    child: TitleText(
                      text: hintValue(),
                      isTitle: false,
                      subTitleSize: 16,
                      subTitleColor: cubit.jobStatus == null
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
                  items: cubit.jobStatusItems.map((String items) {
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
                    cubit.changeJobStatus(newValue);
                    
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String hintValue() {
    if (jobStatus == FBFirestoreName.empJobStatusOnWork) {
      return "على قوة العمل";
    }
    if (jobStatus == FBFirestoreName.empJobStatusTermination) {
      return "استبعاد";
    } else {
      return "الاستقالة";
    }
  }
}
