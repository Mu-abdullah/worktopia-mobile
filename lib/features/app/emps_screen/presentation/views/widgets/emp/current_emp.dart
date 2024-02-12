import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/helper/firebase_names.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/utils/tables_name.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../../../manger/current_cubit/current_emp_cubit.dart';
import '../../../manger/current_cubit/current_emp_state.dart';
import '../employee_item.dart';

class CurrentEmp extends StatefulWidget {
  const CurrentEmp({super.key, required this.scoop});
  final String scoop;

  @override
  State<CurrentEmp> createState() => _CurrentEmpState();
}

class _CurrentEmpState extends State<CurrentEmp> {
  @override
  void initState() {
    BlocProvider.of<CurrentEmpCubit>(context)
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
    return BlocConsumer<CurrentEmpCubit, CurrentEmpState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SuccessSubCollection) {
          if (state.departments.isEmpty) {
            return const Center(
              child: TitleText(text: "لا يوجد حالياً أي عمالة تم تسجيلها"),
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context)
                  .size
                  .height, // Adjust the height as needed
              child: ListView.builder(
                itemCount: state.departments.length,
                itemBuilder: (context, index) {
                  return EmployeeItem(
                    scoop: widget.scoop,
                    emp: state.departments[index],
                  );
                },
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
          return const TitleText(text: "يوجد خطأ");
        }
      },
    );
  }
}
