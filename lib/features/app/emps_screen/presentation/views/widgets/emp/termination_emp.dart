import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/helper/firebase_names.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/utils/tables_name.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../../../manger/termination_cubit/termination_emp_cubit.dart';
import '../../../manger/termination_cubit/termination_emp_state.dart';
import '../employee_item.dart';

class TerminationEmp extends StatefulWidget {
  const TerminationEmp({super.key, required this.scoop});
  final String scoop;

  @override
  State<TerminationEmp> createState() => _TerminationEmpState();
}

class _TerminationEmpState extends State<TerminationEmp> {
  @override
  void initState() {
    BlocProvider.of<TerminationEmpCubit>(context)
        .fetchEmpCompanies(departmentId: collectionID());
    super.initState();
  }

  String collectionID() {
    if (widget.scoop == TableName.supplyEmp) {
      return FBFirestoreName.dDocumentSupplyEmp;
    } else if (widget.scoop == TableName.buffet) {
      return FBFirestoreName.dDocumentBuffet;
    } else if (widget.scoop == TableName.clean) {
      return FBFirestoreName.dDocumentClean;
    } else if (widget.scoop == TableName.farm) {
      return FBFirestoreName.dDocumentZra3a;
    } else {
      return FBFirestoreName.dDocumentAntiReed;
    }
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
                          return EmployeeItem(
                            scoop: widget.scoop,
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
