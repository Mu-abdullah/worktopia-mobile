
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/entites/emoloyees_model.dart';
import '../../../../../../../core/helper/firebase_names.dart';
import '../../../../../../../core/utils/app_routs.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../../../core/widgets/show_progress_indecator.dart';
import '../../../manger/new_emp_cubit/new_emp_cubit.dart';
import '../../../manger/new_emp_cubit/new_emp_state.dart';

class UploadUserInfo extends StatelessWidget {
  const UploadUserInfo({
    super.key,
    required this.cubit,
    required this.formKey,
    required this.empID,
    required this.phone,
    required this.name,
    required this.address,
    required this.banckAcc,
    required this.nid,
    required this.startJob,
  });

  final NewEmpCubit cubit;
  final GlobalKey<FormState> formKey;
  final TextEditingController empID;
  final TextEditingController phone;
  final TextEditingController name;
  final TextEditingController address;
  final TextEditingController banckAcc;
  final TextEditingController nid;
  final TextEditingController startJob;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewEmpCubit, NewEmpState>(
      listener: (context, state) {
        if (state is CreateEmpLoading) {
          showCustomProgressIndicator(context, "جاري تحميل بيانات العامل");
        }
        if (state is CreateEmpSuccess) {
          Future.delayed(
              const Duration(
                seconds: 2,
              ), () {
            Navigator.pop(context);
            snackBar(context,
                contentText: "تم تحميل البيانات بنجاح", seconds: 2);
            GoRouter.of(context).pop(AppRouter.homeScreen);
          });
        }
        if (state is CreateEmpFailure) {
          Future.delayed(
              const Duration(
                seconds: 2,
              ), () {
            Navigator.pop(context);
            if (kDebugMode) {
              print("+++++++++++++++++++++++");
            }
            if (kDebugMode) {
              print(state.error.toString());
            }
            if (kDebugMode) {
              print("+++++++++++++++++++++++");
            }
            snackBar(context, contentText: "مشكلة ${state.error}", seconds: 10);
          });
        }
      },
      child: CustomButton( width: kIsWeb ? .35 : 1,
        onPress: cubit.departmentValue == null || cubit.scoopValue == null
            ? () {
                snackBar(
                  context,
                  contentText: "اكمل البيانات",
                  seconds: 2,
                  background: AppColor.yellowColor,
                  contentColor: AppColor.navyColor,
                );
              }
            : () {
                if (formKey.currentState!.validate()) {
                  final data = EmpsModels(
                    empId: empID.text,
                    empAddress: address.text,
                    empBankAcc: banckAcc.text,
                    empDepartment: cubit.departmentValue,
                    empImage: cubit.imageUrl,
                    empNId: nid.text,
                    empPhoneNumber: phone.text,
                    empName: name.text,
                    startJob: startJob.text,
                    scoop: cubit.scoopValue,
                    endJobReaseon: null,
                    endJob: null,
                    departmentId: cubit.departmentCollectionId(),
                    jobStatus: FBFirestoreName.empJobStatusOnWork,
                  );
                  cubit.addEmpInfo(emp: data);
                }
              },
        buttonName: "اضافة البيانات",
      ),
    );
  }
}
