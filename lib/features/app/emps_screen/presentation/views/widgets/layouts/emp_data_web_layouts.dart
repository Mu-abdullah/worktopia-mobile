import 'package:flutter/foundation.dart';
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
import '../bottom_sheet_emp_data/bttom_bank_acc.dart';
import '../emp_details_screen.dart';
import '../on_work_info.dart';
import '../termenation_resigend.dart';

class EmpDataWebView extends StatelessWidget {
  const EmpDataWebView({
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomSheetEMPImage(widget: widget),
                    const SizedBox(
                      width: 20,
                    ),
                    WebData(widget: widget),
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

class WebData extends StatelessWidget {
  const WebData({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // BottomSheetEMPName(widget: widget),
          SizedBox(child: kIsWeb ? TitleText(text: widget.model.scoop!) : null),
          const SizedBox(height: 15),
          BottomSheetEMPID(widget: widget),
          const SizedBox(height: 15),
          BottomSheetEMPStatus(widget: widget),
          const SizedBox(height: 15),
          BottomSheetStartJob(widget: widget),
          const SizedBox(height: 15),
          BottomSheetEMPAddress(widget: widget),
          const SizedBox(height: 15),
          BottomSheetEMPBankAcc(widget: widget),
          const SizedBox(height: 15),
          BottomSheetEMPPhoneNumber(widget: widget),
          const SizedBox(height: 15),
          BottomSheetEMPnID(widget: widget),
          const SizedBox(height: 15),
          SizedBox(
            child: widget.model.jobStatus == FBFirestoreName.empJobStatusOnWork
                ? OnWorkInfo(widget: widget)
                : ResigendAndTerminationInfo(widget: widget),
          ),
        ],
      ),
    );
  }
}
