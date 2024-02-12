import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/default_texts.dart';
import '../manger/new_emp_cubit/new_emp_cubit.dart';
import 'widgets/new_emp_body.dart';

class NewEmpScreen extends StatelessWidget {
  const NewEmpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewEmpCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const TitleText(text: "اضافة عامل"),
          ),
          body: const NewEmpBody(),
        ),
      ),
    );
  }
}
