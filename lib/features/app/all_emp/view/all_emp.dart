import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:worktopia/core/utils/colors.dart';
import 'package:worktopia/features/app/all_emp/cubit/all_emp_state.dart';

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
          floatingActionButton: FloatingButton(),
          body: AllEmpListView(),
        ),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllEmpCubit, AllEmpState>(
      builder: (context, state) {
        if (state is SuccessAllEmpState) {
          return FloatingActionButton(
            backgroundColor: AppColor.navyColor,
            onPressed: () {
              BlocProvider.of<AllEmpCubit>(context).createExcel(
                employees: state.emps!,
                // department: state.department!,
              );
            },
            child: const Icon(
              kIsWeb ? Icons.print_outlined : Iconsax.printer,
              color: AppColor.yellowColor,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
