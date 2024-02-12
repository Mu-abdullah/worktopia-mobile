
import 'package:flutter/material.dart';

import '../../../../../../core/entites/department_model.dart';
import '../../../../../../core/entites/emoloyees_model.dart';
import '../../../../../../core/helper/firebase_names.dart';
import 'bottom_sheet_emp_data/bottom_sheet_addres.dart';
import 'bottom_sheet_emp_data/bottom_sheet_emp_id.dart';
import 'bottom_sheet_emp_data/bottom_sheet_emp_image.dart';
import 'bottom_sheet_emp_data/bottom_sheet_job_status.dart';
import 'bottom_sheet_emp_data/bottom_sheet_nid.dart';
import 'bottom_sheet_emp_data/bottom_sheet_phone_number.dart';
import 'bottom_sheet_emp_data/bottom_sheet_scoop.dart';
import 'bottom_sheet_emp_data/bottom_sheet_bottons.dart';
import 'bottom_sheet_emp_data/bottom_sheet_emp_name.dart';
import 'on_work_info.dart';
import 'termenation_resigend.dart';

class EmpBottomSheet extends StatefulWidget {
  const EmpBottomSheet({
    super.key,
    required this.model,
    required this.departmentsModel,
  });
  final EmpsModels model;
  final DepartmentsModel departmentsModel;
  @override
  State<EmpBottomSheet> createState() => _EmpBottomSheetState();
}

class _EmpBottomSheetState extends State<EmpBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetEMPImage(widget: widget),
          const SizedBox(height: 10),
          BottomSheetEMPName(widget: widget),
          const SizedBox(height: 5),
          BottomSheetEMPStatus(widget: widget),
          const SizedBox(height: 5),
          BottomSheetEMPID(widget: widget),
          const SizedBox(height: 5),
          BottomSheetEMPScoop(widget: widget),
          const SizedBox(height: 5),
          BottomSheetEMPAddress(widget: widget),
          const SizedBox(height: 5),
          BottomSheetEMPPhoneNumber(widget: widget),
          const SizedBox(height: 5),
          BottomSheetEMPnID(widget: widget),
          const SizedBox(height: 5),
          SizedBox(
            child: widget.model.jobStatus == FBFirestoreName.empJobStatusOnWork
                ? OnWorkInfo(widget: widget)
                : ResigendAndTerminationInfo(widget: widget),
          ),
          const SizedBox(height: 10),
          BottomSheetsButtons(widget: widget),
        ],
      ),
    );
  }
}



