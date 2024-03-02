
import 'package:flutter/material.dart';

import '../../../../../../core/widgets/default_texts.dart';
import '../../manger/current_cubit/current_emp_cubit.dart';
import '../../manger/current_cubit/current_emp_state.dart';
import 'emp/current_emp.dart';

class PrintEmployees extends StatelessWidget {
  const PrintEmployees({
    super.key,
    required this.widget,
    required this.formKey,
    required this.state,
  });

  final CurrentEmp widget;
  final GlobalKey<FormState> formKey;
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
              text:
                  "هل تريد طباعة بيانات عمالة شركة ${widget.companyForNow} المنوط بها ${widget.departmentName}",
              maxLine: 10,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              CurrentEmpCubit().printEmp(
                employees: state.departments,
                departmentName: widget.departmentName,
                salary: widget.salary,
                incentive: widget.incective,
              );

              Navigator.pop(context);
            }
          },
          child: const TitleText(
              isTitle: false,
              subTitleColor: Colors.blue,
              text: 'طباعة البيانات'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const TitleText(
              isTitle: false, subTitleColor: Colors.red, text: 'اغلاق'),
        ),
      ],
    );
  }
}
