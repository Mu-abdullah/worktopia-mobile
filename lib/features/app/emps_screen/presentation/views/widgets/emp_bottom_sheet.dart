import 'package:flutter/material.dart';
import 'package:worktopia/core/utils/constant.dart';
import 'package:worktopia/core/widgets/default_texts.dart';

import '../../../../../../core/entites/department_model.dart';
import '../../../../../../core/entites/emoloyees_model.dart';
import '../../../../../../core/helper/firebase_names.dart';
import 'bottom_sheet_emp_data/bottom_sheet_addres.dart';
import 'bottom_sheet_emp_data/bottom_sheet_emp_id.dart';
import 'bottom_sheet_emp_data/bottom_sheet_emp_image.dart';
import 'bottom_sheet_emp_data/bottom_sheet_job_status.dart';
import 'bottom_sheet_emp_data/bottom_sheet_nid.dart';
import 'bottom_sheet_emp_data/bottom_sheet_phone_number.dart';
import 'bottom_sheet_emp_data/bottom_sheet_bottons.dart';
import 'bottom_sheet_emp_data/bottom_sheet_emp_name.dart';
import 'bottom_sheet_emp_data/bottom_sheet_startjob.dart';
import 'on_work_info.dart';
import 'termenation_resigend.dart';

class EmpBottomSheet extends StatefulWidget {
  const EmpBottomSheet({
    super.key,
    required this.model,
    required this.departmentsModel,
  });
  final EmployeesModel model;
  final DepartmentsModel departmentsModel;
  @override
  State<EmpBottomSheet> createState() => _EmpBottomSheetState();
}

class _EmpBottomSheetState extends State<EmpBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleText(text: widget.model.scoop!),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= Constant.mobileWidth) {
              return EmpDataMobileLayouts(widget: widget);
            } else {
              return EmpDataWebView(widget: widget);
            }
          },
        ),
      ),
    );
  }
}

class EmpDataWebView extends StatelessWidget {
  const EmpDataWebView({
    super.key,
    required this.widget,
  });

  final EmpBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomSheetEMPImage(widget: widget),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        BottomSheetEMPName(widget: widget),
                        const SizedBox(height: 15),
                        BottomSheetEMPID(widget: widget),
                        const SizedBox(height: 15),
                        BottomSheetEMPStatus(widget: widget),
                        const SizedBox(height: 15),
                        BottomSheetStartJob(widget: widget),
                        const SizedBox(height: 15),
                        BottomSheetEMPID(widget: widget),
                        const SizedBox(height: 15),
                        BottomSheetEMPAddress(widget: widget),
                        const SizedBox(height: 15),
                        BottomSheetEMPPhoneNumber(widget: widget),
                        const SizedBox(height: 15),
                        BottomSheetEMPnID(widget: widget),
                        const SizedBox(height: 15),
                        SizedBox(
                          child: widget.model.jobStatus ==
                                  FBFirestoreName.empJobStatusOnWork
                              ? OnWorkInfo(widget: widget)
                              : ResigendAndTerminationInfo(widget: widget),
                        ),
                      ],
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
        BottomSheetsButtons(widget: widget),
      ],
    );
  }
}

class EmpDataMobileLayouts extends StatelessWidget {
  const EmpDataMobileLayouts({
    super.key,
    required this.widget,
  });

  final EmpBottomSheet widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BottomSheetEMPImage(widget: widget),
                const SizedBox(height: 10),
                BottomSheetEMPName(widget: widget),
                const SizedBox(height: 10),
                BottomSheetEMPStatus(widget: widget),
                const SizedBox(height: 10),
                BottomSheetStartJob(widget: widget),
                const SizedBox(height: 10),
                BottomSheetEMPID(widget: widget),
                const SizedBox(height: 10),
                BottomSheetEMPAddress(widget: widget),
                const SizedBox(height: 10),
                BottomSheetEMPPhoneNumber(widget: widget),
                const SizedBox(height: 10),
                BottomSheetEMPnID(widget: widget),
                const SizedBox(height: 10),
                SizedBox(
                  child: widget.model.jobStatus ==
                          FBFirestoreName.empJobStatusOnWork
                      ? OnWorkInfo(widget: widget)
                      : ResigendAndTerminationInfo(widget: widget),
                ),
              ],
            ),
          ),
        ),
        BottomSheetsButtons(widget: widget),
      ],
    );
  }
}
