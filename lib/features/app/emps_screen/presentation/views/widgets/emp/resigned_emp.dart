import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../../../manger/resigned_cubit/resigned_emp_cubit.dart';
import '../../../manger/resigned_cubit/resigned_emp_state.dart';
import '../employee_item_mobile.dart';

class ResignedEmp extends StatefulWidget {
  const ResignedEmp({super.key, required this.docId});
  final String docId;

  @override
  State<ResignedEmp> createState() => _ResignedEmpState();
}

class _ResignedEmpState extends State<ResignedEmp> {
  @override
  void initState() {
    BlocProvider.of<ResignedEmpCubit>(context)
        .fetchEmpCompanies(departmentId: widget.docId);
    super.initState();
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
                          : _resignedEmpCount(state),
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

  TitleText _resignedEmpCount(SuccessSubCollection state) {
    return TitleText(
        text:
            "عدد العمالة المستقيلة : ${state.departments.length.toString()} عامل");
  }
}
