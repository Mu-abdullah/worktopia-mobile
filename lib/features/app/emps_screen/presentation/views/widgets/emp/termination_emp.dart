import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../../../manger/termination_cubit/termination_emp_cubit.dart';
import '../../../manger/termination_cubit/termination_emp_state.dart';
import '../employee_item_mobile.dart';

class TerminationEmp extends StatefulWidget {
  const TerminationEmp({super.key, required this.docId});
  final String docId;

  @override
  State<TerminationEmp> createState() => _TerminationEmpState();
}

class _TerminationEmpState extends State<TerminationEmp> {
  @override
  void initState() {
    BlocProvider.of<TerminationEmpCubit>(context)
        .fetchEmpCompanies(departmentId: widget.docId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TerminationEmpCubit, TerminationEmpState>(
      listener: (context, state) {},
      builder: (context, state) {
        // CurrentEmpCubit cubit = CurrentEmpCubit.get(context);
        if (state is SuccessSubCollection) {
          if (state.departments.isEmpty) {
            return const Center(
                child: TitleText(text: "لا يوجد حالياً أي عمالة تم استبعادها"));
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context)
                    .size
                    .height, // Adjust the height as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      child: state.departments.isEmpty
                          ? null
                          : _terminationEmpCount(state),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.departments.length,
                        itemBuilder: (context, index) {
                          return MobileEmployeeItem(
                            departmentModel: widget.docId,
                            emp: state.departments[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.whiteColor,
            ),
          );
        } else {
          return const TitleText(text: "يوجد خطا");
        }
      },
    );
  }

  TitleText _terminationEmpCount(SuccessSubCollection state) {
    return TitleText(
        text:
            "عدد العمالة المستبعدة : ${state.departments.length.toString()} عامل");
  }
}
