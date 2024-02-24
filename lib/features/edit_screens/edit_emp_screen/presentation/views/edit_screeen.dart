import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entites/emoloyees_model.dart';
import '../../../../../core/widgets/default_texts.dart';
import '../manger/cubit/edit_emp_cubit.dart';
import 'widgets/edit_emp_body.dart';

class EditEmpScreen extends StatelessWidget {
  const EditEmpScreen({
    super.key,
    required this.model,
  });
  final EmployeesModel model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditEmpCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const TitleText(text: "تعديل بيانات العامل"),
          ),
          body: EditBody(
            models: model,
          ),
        ),
      ),
    );
  }
}
