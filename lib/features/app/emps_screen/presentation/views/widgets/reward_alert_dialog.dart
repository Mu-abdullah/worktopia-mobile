
import 'package:flutter/material.dart';
import 'package:worktopia/core/widgets/custom_text_field.dart';

import '../../../../../../core/widgets/default_texts.dart';
import '../../manger/current_cubit/current_emp_cubit.dart';
import '../../manger/current_cubit/current_emp_state.dart';
import 'emp/current_emp.dart';

class RewardAlertDialog extends StatelessWidget {
  const RewardAlertDialog({
    super.key,
    required this.widget,
    required this.formKey,
    required this.manyMonthes,
    required this.state,
  });

  final CurrentEmp widget;
  final GlobalKey<FormState> formKey;
  final TextEditingController manyMonthes;
  final SuccessSubCollection state;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleText(
              text: "مكافاءة لعمالة شركة ${widget.companyForNow}",
              maxLine: 3,
            )
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Form(
              key: formKey,
              child: CustomTextField(
                hint: "عدد الشهور",
                label: "عدد الشهور",
                prefix: const Icon(Icons.numbers),
                isPassword: false,
                controller: manyMonthes,
                type: TextInputType.number,
                maxLines: 1,
                validate: (value) {
                  if (value.isEmpty) {
                    return "ادخل العدد";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            TitleText(
              text:
                  " المنوط بها ${widget.departmentName} لعدد ${state.departments.length.toString()} عامل",
              maxLine: 3,
              isTitle: false,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              CurrentEmpCubit().createReward(
                employees: state.departments,
                departmentName: widget.departmentName,
                salary: widget.salary,
                incentive: widget.incective,
                many: double.parse(manyMonthes.text),
              );
              manyMonthes.clear();
              Navigator.pop(context);
            }
          },
          child: const TitleText(
              isTitle: false,
              subTitleColor: Colors.blue,
              text: 'استخراج المكافاءة'),
        ),
        TextButton(
          onPressed: () {
            manyMonthes.clear();
            Navigator.of(context).pop();
          },
          child: const TitleText(
              isTitle: false, subTitleColor: Colors.red, text: 'اغلاق'),
        ),
      ],
    );
  }
}
