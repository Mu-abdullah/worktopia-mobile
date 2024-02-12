import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/helper/firebase_names.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/utils/constant.dart';
import '../../../../../../../core/utils/tables_name.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../../../manger/resigned_cubit/resigned_emp_cubit.dart';
import '../../../manger/resigned_cubit/resigned_emp_state.dart';
import '../employee_item.dart';

class ResignedEmp extends StatefulWidget {
  const ResignedEmp({super.key, required this.scoop});
  final String scoop;

  @override
  State<ResignedEmp> createState() => _ResignedEmpState();
}

class _ResignedEmpState extends State<ResignedEmp> {
  @override
  void initState() {
    BlocProvider.of<ResignedEmpCubit>(context)
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
    return BlocConsumer<ResignedEmpCubit, ResignedEmpState>(
      listener: (context, state) {},
      builder: (context, state) {
        // CurrentEmpCubit cubit = CurrentEmpCubit.get(context);
        if (state is SuccessSubCollection) {
          if (state.departments.isEmpty) {
            return const Center(
                child: TitleText(text: "لا يوجد حالياً أي عمالة استقالت"));
          } else {
            return SizedBox(
              height: MediaQuery.of(context)
                  .size
                  .height, // Adjust the height as needed
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth <= Constant.mobileWidth) {
                    return ListView.builder(
                      itemCount: state.departments.length,
                      itemBuilder: (context, index) {
                        return EmployeeItem(
                          scoop: widget.scoop,
                          emp: state.departments[index],
                        );
                      },
                    );
                  } else if (constraints.maxWidth <= Constant.tabletWidth) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        mainAxisSpacing: 0, // Spacing between rows
                      ),

                      itemCount:
                          state.departments.length, // Total number of items
                      itemBuilder: (BuildContext context, int index) {
                        // Generating items lazily
                        return EmployeeItem(
                          scoop: widget.scoop,
                          emp: state.departments[index],
                        );
                      },
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // Number of columns
                        mainAxisSpacing: 0, // Spacing between rows
                      ),
                      itemCount:
                          state.departments.length, // Total number of items
                      itemBuilder: (BuildContext context, int index) {
                        // Generating items lazily
                        return EmployeeItem(
                          scoop: widget.scoop,
                          emp: state.departments[index],
                        );
                      },
                    );
                  }
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
          return const TitleText(text: "يوجد خطا");
        }
      },
    );
  }
}
