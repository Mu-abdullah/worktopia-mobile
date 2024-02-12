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

class NewEmpWebLayouts extends StatelessWidget {
  const NewEmpWebLayouts({
    super.key,
    required this.formKey,
    required this.cubit,
    required this.empID,
    required String wanted,
    required this.name,
    required this.address,
    required this.startJob,
    required this.nid,
    required this.banckAcc,
    required this.phone,
  }) : _wanted = wanted;

  final GlobalKey<FormState> formKey;
  final NewEmpCubit cubit;
  final TextEditingController empID;
  final String _wanted;
  final TextEditingController name;
  final TextEditingController address;
  final TextEditingController startJob;
  final TextEditingController nid;
  final TextEditingController banckAcc;
  final TextEditingController phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            EmpImage(cubit: cubit),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: EmpId(userID: empID, wanted: _wanted),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: EmpName(name: name, wanted: _wanted),
                ),
                const SizedBox(width: 10),
                Expanded(child: EmpAddress(address: address, wanted: _wanted)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: EmpNID(nid: nid, wanted: _wanted),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: EmpBankAcc(banckAcc: banckAcc, wanted: _wanted)),
                const SizedBox(width: 10),
                Expanded(
                  child: EmpPhone(phone: phone, wanted: _wanted),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: EmpStartJob(startJob: startJob, wanted: _wanted),
                ),
                const SizedBox(width: 10),
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
