import 'package:flutter/material.dart';

import '../../../manger/cubit/edit_emp_cubit.dart';
import '../form_feiled/edit_address.dart';
import '../form_feiled/edit_bank_acc.dart';
import '../form_feiled/edit_emp_id.dart';
import '../form_feiled/edit_end_job_reaseon.dart';
import '../form_feiled/edit_end_job.dart';
import '../form_feiled/edit_form_failed.dart';
import '../form_feiled/edit_name.dart';
import '../form_feiled/edit_phone_number.dart';
import '../form_feiled/edit_start_job.dart';
import '../image_edit.dart';
import '../job_status.dart';

class EditEmpMobileLayouts extends StatelessWidget {
  const EditEmpMobileLayouts({
    super.key,
    required this.empImage,
    required this.empID,
    required String wanted,
    required this.name,
    required this.address,
    required this.phone,
    required this.nid,
    required this.bankAcc,
    required this.startJob,
    required this.cubit,
    required this.jobStatus,
    required this.endJob,
    required this.endJobReaseon,
  }) : _wanted = wanted;

  final String empImage;
  final TextEditingController empID;
  final String _wanted;
  final TextEditingController name;
  final TextEditingController address;
  final TextEditingController phone;
  final TextEditingController nid;
  final TextEditingController bankAcc;
  final TextEditingController startJob;
  final EditEmpCubit cubit;
  final String jobStatus;
  final TextEditingController endJob;
  final TextEditingController endJobReaseon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        EditEmpImage(
          image: empImage,
        ),
        const SizedBox(height: 10),
        EditEmpID(
          empID: empID,
          wanted: _wanted,
        ),
        const SizedBox(height: 10),
        EditName(
          name: name,
          wanted: _wanted,
        ),
        const SizedBox(height: 10),
        EditAdrress(
          address: address,
          wanted: _wanted,
        ),
        const SizedBox(height: 10),
        EditPhoneNumber(
          phone: phone,
          wanted: _wanted,
        ),
        const SizedBox(height: 10),
        EditNID(
          nid: nid,
          wanted: _wanted,
        ),
        const SizedBox(height: 10),
        EditBankAcc(
          banckAcc: bankAcc,
          wanted: _wanted,
        ),
        const SizedBox(height: 10),
        EditStartJob(
          startJob: startJob,
          wanted: _wanted,
        ),
        const SizedBox(height: 10),
        JobStatus(
          cubit: cubit,
          jobStatus: jobStatus,
        ),
        const SizedBox(height: 10),
        SizedBox(
          child: cubit.jobStatus == "على قوة العمل" || cubit.jobStatus == null
              ? null
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    EditEndJob(
                      endJob: endJob,
                      wanted: _wanted,
                      cubit: cubit,
                    ),
                    const SizedBox(height: 10),
                    EndJobReaseon(
                      cubit: cubit,
                      endJobReaseon: endJobReaseon,
                      wanted: _wanted,
                    ),
                  ],
                ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
