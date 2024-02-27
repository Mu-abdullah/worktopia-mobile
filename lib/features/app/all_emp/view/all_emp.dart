import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/all_emp_cubit.dart';
import 'widgets/all_emp_listview.dart';

class AllEmp extends StatelessWidget {
  const AllEmp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllEmpCubit(),
      child: const SafeArea(
        child: Scaffold(
          body: AllEmpListView(),
        ),
      ),
    );
  }
}
