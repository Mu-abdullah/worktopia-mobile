import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/firebase_names.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/default_texts.dart';
import '../../cubit/all_emp_cubit.dart';
import '../../cubit/all_emp_state.dart';
import 'all_emp_item.dart';

class AllEmpListView extends StatelessWidget {
  const AllEmpListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AllEmpCubit>(context).getDepartmentDocuments([
      FBFirestoreName.dDocumentSupplyEmp,
      FBFirestoreName.dDocumentBuffet,
      FBFirestoreName.dDocumentClean,
      FBFirestoreName.dDocumentZra3a,
      FBFirestoreName.dDocumentAntiReed,
    ]);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
              height: 50,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)),
                  const SizedBox(width: 10),
                  BlocBuilder<AllEmpCubit, AllEmpState>(
                    builder: (context, state) {
                      if (state is SuccessAllEmpState) {
                        return TitleText(
                            text:
                                "جميع العمالة ${state.emps!.length.toString()} عامل / عاملة");
                      }
                      if (state is FailedAllEmpState) {
                        return const TitleText(text: "يوجد خطأ");
                      }
                      return const TitleText(text: "جاري تحميل العمالة");
                    },
                  ),
                ],
              )),
          Expanded(
            child: BlocBuilder<AllEmpCubit, AllEmpState>(
              builder: (context, state) {
                if (state is SuccessAllEmpState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.emps!.length,
                      itemBuilder: (context, index) {
                        return AllEmpItem(
                          // department: state.department![index],
                          emp: state.emps![index],
                        );
                      },
                    ),
                  );
                }
                if (state is FailedAllEmpState) {
                  return const TitleText(text: "يوجد مشكلة في تحميل البيانات");
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.yellowColor,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
