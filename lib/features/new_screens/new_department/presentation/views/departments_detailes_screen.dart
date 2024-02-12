import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/default_texts.dart';
import '../manger/department_cubit/department_cubit.dart';
import '../manger/department_cubit/department_state.dart';
import 'widgets/department_body.dart';

class DepartmentsScreen extends StatelessWidget {
  const DepartmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentCubit()..getCompaniesNames(),
      child: BlocConsumer<DepartmentCubit, DepartmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          // AddAllEmpCubit cubit = AddAllEmpCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: const TitleText(text: "اضافة قسم")),
            body: const DepartmentBody(),
          );
        },
      ),
    );
  }
}
