
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entites/department_model.dart';
import '../../../../../core/widgets/default_texts.dart';
import '../manger/cubit/edit_department_cubit.dart';
import 'widgets/edit_department_body.dart';

class EditDepartmentScreen extends StatelessWidget {
  const EditDepartmentScreen({super.key, required this.model});
  final DepartmentsModel model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditDepartmentCubit()..getCompaniesNames(),
      child: Scaffold(
        appBar: AppBar(
          title: TitleText(text: "تعديل ${model.departmentName!}"),
        ),
        body: EditDepartmentBody(
          model: model,
        ),
      ),
    );
  }
}
