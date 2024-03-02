import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_routs.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../../core/widgets/show_progress_indecator.dart';
import '../../manger/department_cubit/department_cubit.dart';
import '../../manger/department_cubit/department_state.dart';
import 'create_deparement_button.dart';
import 'department_form_fields.dart';
import 'department_name_drop_menu.dart';

class DepartmentBody extends StatefulWidget {
  const DepartmentBody({
    super.key,
  });

  @override
  State<DepartmentBody> createState() => _DepartmentBodyState();
}

class _DepartmentBodyState extends State<DepartmentBody> {
  final salary = TextEditingController();
  final companySalaryForEmp = TextEditingController();
  final incetive = TextEditingController();
  final extraDayForCompany = TextEditingController();
  final extraHourForCompany = TextEditingController();
  final extraDayForEmp = TextEditingController();
  final extraHourForEmp = TextEditingController();
  final companyStartIn = TextEditingController();
  final companyEndIn = TextEditingController();
  final extraNighShiftHourForCompany = TextEditingController();
  final extraNightShiftHourForEmp = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DepartmentCubit, DepartmentState>(
      listener: (context, state) {
        if (state is CreateDepartmentLoading) {
          showCustomProgressIndicator(context: context, text:  "جاري تحميل البيانات");
        }
        if (state is CreateDepartmentSuccess) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pop(context);
            GoRouter.of(context).pop(AppRouter.newHomeScreen);
            snackBar(
              context,
              contentText: "تم انشاء القسم بنجاح",
              seconds: 3,
            );
          });
        }
        if (state is CreateDepartmentFailure) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pop(context);
            snackBar(
              context,
              contentText: "يوجد خطأ اثناء تحميل البيانات",
              seconds: 3,
              background: AppColor.whiteColor,
              contentColor: AppColor.navyColor,
            );
          });
        }
      },
      builder: (context, state) {
        DepartmentCubit cubit = DepartmentCubit.get(context);
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const DepartNameDropMenu(),
                  const SizedBox(
                    height: 10,
                  ),
                  DepartmentDetailsTextFormFeilds(
                    wanted: _wanted,
                    salary: salary,
                    incetive: incetive,
                    extraDayForCompany: extraDayForCompany,
                    extraDayForEmp: extraDayForEmp,
                    extraHourForCompany: extraHourForCompany,
                    extraHourForEmp: extraHourForEmp,
                    companyStartIn: companyStartIn,
                    companyEndIn: companyEndIn,
                    extraNighShiftHourForCompany: extraNighShiftHourForCompany,
                    extraNightShiftHourForEmp: extraNightShiftHourForEmp,
                    companySalaryForEmp: companySalaryForEmp,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CreateDepartmentButton(
                    formKey: formKey,
                    salary: salary,
                    companySalaryForEmp: companySalaryForEmp,
                    incetive: incetive,
                    cubit: cubit,
                    companyStartIn: companyStartIn,
                    companyEndIn: companyEndIn,
                    extraDayForCompany: extraDayForCompany,
                    extraDayForEmp: extraDayForEmp,
                    extraHourForCompany: extraHourForCompany,
                    extraHourForEmp: extraHourForEmp,
                    extraNighShiftHourForCompany: extraNighShiftHourForCompany,
                    extraNightShiftHourForEmp: extraNightShiftHourForEmp,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String get _wanted => "مطلوب";
}
