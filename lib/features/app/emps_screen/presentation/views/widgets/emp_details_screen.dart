import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:worktopia/core/utils/constant.dart';
import 'package:worktopia/core/widgets/default_texts.dart';

import '../../../../../../core/entities/department_model.dart';
import '../../../../../../core/entities/emoloyees_model.dart';

import 'layouts/emp_data_mobile_layouts.dart';
import 'layouts/emp_data_web_layouts.dart';

class EmpDetailsScreen extends StatefulWidget {
  const EmpDetailsScreen({
    super.key,
    required this.model,
    required this.departmentsModel,
  });
  final EmployeesModel model;
  final DepartmentsModel departmentsModel;
  @override
  State<EmpDetailsScreen> createState() => _EmpDetailsScreenState();
}

class _EmpDetailsScreenState extends State<EmpDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleText(
          text: kIsWeb ? widget.model.empName! : widget.model.scoop!,
          titleSize: 28,
        ),
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
