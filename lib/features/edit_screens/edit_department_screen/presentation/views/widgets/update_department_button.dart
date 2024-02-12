
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/entites/department_model.dart';
import '../../../../../../core/utils/app_routs.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../../core/widgets/show_progress_indecator.dart';
import '../../manger/cubit/edit_department_cubit.dart';
import '../../manger/cubit/edit_department_state.dart';
import 'edit_department_body.dart';

class UpdateDepartmentButton extends StatelessWidget {
  const UpdateDepartmentButton({
    super.key,
    required this.formKey,
    required this.salary,
    required this.incetive,
    required this.companyStartIn,
    required this.companyEndIn,
    required this.extraDayForCompany,
    required this.extraDayForEmp,
    required this.extraHourForCompany,
    required this.extraHourForEmp,
    required this.extraNighShiftHourForCompany,
    required this.extraNightShiftHourForEmp,
    required this.widget,
    required this.salaryForCompany,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController salary;
  final TextEditingController incetive;
  final TextEditingController companyStartIn;
  final TextEditingController companyEndIn;
  final TextEditingController extraDayForCompany;
  final TextEditingController extraDayForEmp;
  final TextEditingController extraHourForCompany;
  final TextEditingController extraHourForEmp;
  final TextEditingController extraNighShiftHourForCompany;
  final TextEditingController extraNightShiftHourForEmp;
  final EditDepartmentBody widget;
  final TextEditingController salaryForCompany;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditDepartmentCubit, EditDepartmentState>(
      listener: _listener,
      builder: (context, state) {
        EditDepartmentCubit cubit = EditDepartmentCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
            buttonName: "تعديل بيانات القسم",
            onPress: () {
              if (formKey.currentState!.validate()) {
                var data = DepartmentsModel(
                  empSalary: double.parse(salary.text),
                  empsIncentive: double.parse(incetive.text),
                  departmentCompanyForNow: cubit.companyValue ??
                      widget.model.departmentCompanyForNow,
                  departmentCompanyStartIn: companyStartIn.text,
                  departmentCompanyEndIn: companyEndIn.text,
                  extraDayForCompany: double.parse(extraDayForCompany.text),
                  extraDayForEmp: double.parse(extraDayForEmp.text),
                  extraHourForCompany: double.parse(extraHourForCompany.text),
                  extraHourForEmp: double.parse(extraHourForEmp.text),
                  extraNightShiftHourForCompany:
                      double.parse(extraNighShiftHourForCompany.text),
                  extraNightShiftHourForEmp:
                      double.parse(extraNightShiftHourForEmp.text),
                  departmentId: widget.model.departmentId,
                  departmentName: widget.model.departmentName,
                  companySalaryFroEmp: double.parse(salaryForCompany.text),
                );
                cubit.updateDepartment(
                  data: data,
                  docID: widget.model.departmentId!,
                );
              }
            },
          ),
        );
      },
    );
  }

  void _listener(context, state) {
      if (state is LoadingUpdateDepartment) {
        showCustomProgressIndicator(context, "جاري تعديل البيانات");
      }
      if (state is SuccessUpdateDepartment) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
          GoRouter.of(context).pop(AppRouter.empScreen);
          snackBar(
            context,
            contentText: "تم تعديل البيانات بنجاح",
            seconds: 2,
            background: AppColor.yellowColor,
            contentColor: AppColor.navyColor,
          );
        });
      }
      if (state is FaieldUpdateDepartment) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
          GoRouter.of(context).pop;
          snackBar(
            context,
            contentText: "حدث مشكلة اثناء تعديل البيانات",
            seconds: 2,
            background: AppColor.yellowColor,
            contentColor: AppColor.navyColor,
          );
        });
      }
    }
}
