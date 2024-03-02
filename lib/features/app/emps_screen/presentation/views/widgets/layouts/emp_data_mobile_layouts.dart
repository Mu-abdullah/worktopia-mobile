import 'package:flutter/material.dart';

import '../../../../../../../core/helper/firebase_names.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../bottom_sheet_emp_data/bottom_sheet_addres.dart';
import '../bottom_sheet_emp_data/bottom_sheet_bottons.dart';
import '../bottom_sheet_emp_data/bottom_sheet_emp_id.dart';
import '../bottom_sheet_emp_data/bottom_sheet_emp_image.dart';
import '../bottom_sheet_emp_data/bottom_sheet_job_status.dart';
import '../bottom_sheet_emp_data/bottom_sheet_nid.dart';
import '../bottom_sheet_emp_data/bottom_sheet_phone_number.dart';
import '../bottom_sheet_emp_data/bottom_sheet_startjob.dart';
import '../emp_details_screen.dart';
import '../on_work_info.dart';
import '../termenation_resigend.dart';

class EmpDataMobileLayouts extends StatelessWidget {
  const EmpDataMobileLayouts({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

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
                // BottomSheetEMPName(widget: widget),
                TitleText(text: widget.model.scoop!),
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
