
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/entites/emoloyees_model.dart';
import '../../../../../../core/utils/app_routs.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../../core/widgets/show_progress_indecator.dart';
import '../../manger/cubit/edit_emp_cubit.dart';
import '../../manger/cubit/edit_emp_state.dart';
import 'edit_emp_button.dart';
import 'edit_emp_info.dart';

class EditBody extends StatefulWidget {
  const EditBody({
    super.key,
    required this.models,
  });

  final EmpsModels models;
  @override
  State<EditBody> createState() => _EditBodyState();
}

class _EditBodyState extends State<EditBody> {
  final TextEditingController name = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController startJob = TextEditingController();
  final TextEditingController endJob = TextEditingController();
  final TextEditingController empID = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController nid = TextEditingController();
  final TextEditingController bankAcc = TextEditingController();
  final TextEditingController endJobReaseon = TextEditingController();
  String empImage = "";
  late String jobStatus;

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    empImage = widget.models.empImage!;
    name.text = widget.models.empName!;
    address.text = widget.models.empAddress!;
    startJob.text = widget.models.startJob!;
    endJob.text = widget.models.endJob ?? "";
    empID.text = widget.models.empId!;
    phone.text = widget.models.empPhoneNumber!;
    nid.text = widget.models.empNId!;
    bankAcc.text = widget.models.empBankAcc!;
    jobStatus = widget.models.jobStatus!;
    endJobReaseon.text = widget.models.endJobReaseon ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditEmpCubit, EditEmpState>(
      listener: _listener,
      builder: (context, state) {
        EditEmpCubit cubit = EditEmpCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  EmpEditInfo(
                    empImage: empImage,
                    empID: empID,
                    wanted: _wanted,
                    name: name,
                    address: address,
                    phone: phone,
                    nid: nid,
                    bankAcc: bankAcc,
                    startJob: startJob,
                    cubit: cubit,
                    jobStatus: jobStatus,
                    endJob: endJob,
                    endJobReaseon: endJobReaseon,
                  ),
                  UpdateEmpButton(
                    formKey: formKey,
                    empID: empID,
                    address: address,
                    bankAcc: bankAcc,
                    widget: widget,
                    nid: nid,
                    phone: phone,
                    name: name,
                    startJob: startJob,
                    endJobReaseon: endJobReaseon,
                    endJob: endJob,
                    cubit: cubit,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _listener(context, state) {
    if (state is UpdateEmpLoading) {
      showCustomProgressIndicator(context, "جاري تعديل البيانات");
    }
    if (state is UpdateEmpSuccess) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context);
        GoRouter.of(context).pop(AppRouter.empScreen);
        snackBar(
          context,
          contentText: "تم تعديل البيانات بنجاح",
          seconds: 2,
          background: AppColor.yellowColor,
          contentColor: AppColor.navyColor,
        );
      });
    }
    if (state is UpdateEmpFailure) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context);
        GoRouter.of(context).pop;
        snackBar(
          context,
          contentText: "حدث مشكلة اثناء تعديل البيانات",
          seconds: 2,
          background: AppColor.yellowColor,
          contentColor: AppColor.navyColor,
        );
      });
    }
  }

  String get _wanted => "مطلوب";
}
