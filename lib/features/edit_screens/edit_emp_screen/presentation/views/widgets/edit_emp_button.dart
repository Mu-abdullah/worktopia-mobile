import 'package:flutter/material.dart';

import '../../../../../../core/entites/emoloyees_model.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../manger/cubit/edit_emp_cubit.dart';
import 'edit_emp_body.dart';

class UpdateEmpButton extends StatelessWidget {
  const UpdateEmpButton({
    super.key,
    required this.formKey,
    required this.empID,
    required this.address,
    required this.bankAcc,
    required this.widget,
    required this.nid,
    required this.phone,
    required this.name,
    required this.startJob,
    required this.endJobReaseon,
    required this.endJob,
    required this.cubit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController empID;
  final TextEditingController address;
  final TextEditingController bankAcc;
  final EditBody widget;
  final TextEditingController nid;
  final TextEditingController phone;
  final TextEditingController name;
  final TextEditingController startJob;
  final TextEditingController endJobReaseon;
  final TextEditingController endJob;
  final EditEmpCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPress: () {
        if (formKey.currentState!.validate()) {
          final data = EmployeesModel(
            empId: empID.text,
            empAddress: address.text,
            empBankAcc: bankAcc.text,
            empDepartment: widget.models.empDepartment!,
            empImage: widget.models.empImage!,
            empNId: nid.text,
            empPhoneNumber: phone.text,
            empName: name.text,
            startJob: startJob.text,
            scoop: widget.models.scoop!,
            endJobReaseon:
                endJobReaseon.text.isEmpty ? null : endJobReaseon.text,
            endJob: endJob.text.isEmpty ? null : endJob.text,
            departmentId: widget.models.departmentId!,
            jobStatus: cubit.jobStatus == null
                ? widget.models.jobStatus
                : cubit.jobSatausToFirebase(),
          );
          cubit.update(emp: data);
        }
      },
      buttonName: "تعديل بيانات العامل",
    );
  }
}
