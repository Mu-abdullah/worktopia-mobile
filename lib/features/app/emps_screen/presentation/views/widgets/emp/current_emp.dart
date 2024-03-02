import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worktopia/core/utils/constant.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../../../manger/current_cubit/current_emp_cubit.dart';
import '../../../manger/current_cubit/current_emp_state.dart';
import '../employee_item_mobile.dart';
import '../employee_item_web.dart';
import '../print_employees.dart';
import '../reward_alert_dialog.dart';

class CurrentEmp extends StatefulWidget {
  const CurrentEmp({
    super.key,
    required this.docId,
    required this.companyForNow,
    required this.departmentName,
    required this.salary,
    required this.incective,
  });
  final String docId;
  final String companyForNow;
  final String departmentName;
  final dynamic salary;
  final dynamic incective;

  @override
  State<CurrentEmp> createState() => _CurrentEmpState();
}

class _CurrentEmpState extends State<CurrentEmp> {
  @override
  void initState() {
    BlocProvider.of<CurrentEmpCubit>(context)
        .fetchEmpCompanies(departmentId: widget.docId);
    super.initState();
  }

  var manyMonthes = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentEmpCubit, CurrentEmpState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SuccessSubCollection) {
          if (state.departments.isEmpty) {
            return const Center(
              child: TitleText(
                text: "لا يوجد حالياً أي عمالة تم تسجيلها",
              ),
            );
          } else {
            return LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: kIsWeb
                            ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1.5,
                                        crossAxisCount: constraints.maxWidth ==
                                                Constant.mobileWidth
                                            ? 3
                                            : 4),
                                itemBuilder: (_, index) => WebEmployeeItem(
                                    departmentModel: widget.docId,
                                    emp: state.departments[index],
                                    constraints: constraints),
                                itemCount: state.departments.length,
                              )
                            : ListView.builder(
                                itemCount: state.departments.length,
                                itemBuilder: (context, index) {
                                  return MobileEmployeeItem(
                                    departmentModel: widget.docId,
                                    emp: state.departments[index],
                                  );
                                },
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: floatingButtons(state),
                    ),
                  ],
                );
              },
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

  Widget floatingButtons(SuccessSubCollection state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          child: kIsWeb
              ? InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => RewardAlertDialog(
                              widget: widget,
                              formKey: formKey,
                              manyMonthes: manyMonthes,
                              state: state,
                            ));
                  },
                  child: buildInfoContainer(text: "مكافاءة"),
                )
              : null,
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => PrintEmployees(
                      widget: widget,
                      formKey: formKey,
                      state: state,
                    ));
          },
          child: buildInfoContainer(
            text: "${state.departments.length.toString()} عامل",
          ),
        ),
      ],
    );
  }

  Widget buildInfoContainer({required String text}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Constant.radius),
        color: AppColor.navyColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TitleText(
          text: text,
          titleColor: AppColor.whiteColor,
        ),
      ),
    );
  }
}
