import 'package:flutter/material.dart';

import '../../manger/new_emp_cubit/new_emp_cubit.dart';
import '../widgets/add_new_emp.dart';
import '../widgets/department_drop_menu.dart';
import '../widgets/emp_image.dart';
import '../widgets/scoop_drop_menu.dart';
import '../widgets/text_form_field/emp_address.dart';
import '../widgets/text_form_field/emp_bank_acc.dart';
import '../widgets/text_form_field/emp_id.dart';
import '../widgets/text_form_field/emp_name.dart';
import '../widgets/text_form_field/emp_nid.dart';
import '../widgets/text_form_field/emp_phone.dart';
import '../widgets/text_form_field/emp_stat_job.dart';

class NewEmpMobileLayouts extends StatelessWidget {
  const NewEmpMobileLayouts({
    super.key,
    required this.formKey,
    required this.cubit,
    required this.empID,
    required String wanted,
    required this.name,
    required this.address,
    required this.phone,
    required this.nid,
    required this.banckAcc,
    required this.startJob,
  }) : _wanted = wanted;

  final GlobalKey<FormState> formKey;
  final NewEmpCubit cubit;
  final TextEditingController empID;
  final String _wanted;
  final TextEditingController name;
  final TextEditingController address;
  final TextEditingController phone;
  final TextEditingController nid;
  final TextEditingController banckAcc;
  final TextEditingController startJob;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmpImage(cubit: cubit),
            const SizedBox(height: 15),
            EmpId(userID: empID, wanted: _wanted),
            const SizedBox(height: 10),
            EmpName(name: name, wanted: _wanted),
            const SizedBox(height: 10),
            EmpAddress(address: address, wanted: _wanted),
            const SizedBox(height: 10),
            EmpPhone(phone: phone, wanted: _wanted),
            const SizedBox(height: 10),
            EmpNID(nid: nid, wanted: _wanted),
            const SizedBox(height: 10),
            EmpBankAcc(banckAcc: banckAcc, wanted: _wanted),
            const SizedBox(height: 10),
            EmpStartJob(startJob: startJob, wanted: _wanted),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: ChooseDepartment(cubit: cubit)),
                const SizedBox(width: 20),
                Expanded(child: ChooseScoop(cubit: cubit)),
              ],
            ),
            const SizedBox(height: 10),
            AddNewEmp(
              formKey: formKey,
              cubit: cubit,
              empID: empID,
              phone: phone,
              name: name,
              address: address,
              banckAcc: banckAcc,
              nid: nid,
              startJob: startJob,
            ),
          ],
        ),
      ),
    );
  }
}
