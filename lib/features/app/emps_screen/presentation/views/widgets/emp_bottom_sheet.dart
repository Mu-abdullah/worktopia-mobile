import 'package:flutter/material.dart';
import 'package:worktopia/core/utils/constant.dart';
import 'package:worktopia/core/widgets/default_texts.dart';



import '../../../../../../core/entites/department_model.dart';
import '../../../../../../core/entites/emoloyees_model.dart';

import 'layouts/emp_data_mobile_layouts.dart';
import 'layouts/web_layouts.dart';

class EmpBottomSheet extends StatefulWidget {
  const EmpBottomSheet({
    super.key,
    required this.model,
    required this.departmentsModel,
  });
  final EmployeesModel model;
  final DepartmentsModel departmentsModel;
  @override
  State<EmpBottomSheet> createState() => _EmpBottomSheetState();
}

class _EmpBottomSheetState extends State<EmpBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleText(text: widget.model.scoop!),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= Constant.mobileWidth) {
              return EmpDataMobileLayouts(widget: widget);
            } else {
              return EmpDataWebView(widget: widget);
            }
          },
        ),
      ),
    );
  }
}

