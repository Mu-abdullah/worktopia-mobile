import 'package:flutter/material.dart';
import '../../../../../../core/utils/constant.dart';
import '../../manger/cubit/edit_emp_cubit.dart';
import 'layouts/mobile.dart';
import 'layouts/tablet.dart';
import 'layouts/web.dart';

class EmpEditInfo extends StatelessWidget {
  const EmpEditInfo({
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
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= Constant.mobileWidth) {
          return EditEmpMobileLayouts(
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
          );
        } else if (constraints.maxWidth <= Constant.tabletWidth) {
          return EditEmpTabletLayout(
              empImage: empImage,
              empID: empID,
              wanted: _wanted,
              name: name,
              address: address,
              nid: nid,
              bankAcc: bankAcc,
              phone: phone,
              cubit: cubit,
              jobStatus: jobStatus,
              startJob: startJob,
              endJob: endJob,
              endJobReaseon: endJobReaseon);
        } else {
          return EditEmpWebLayout(
              empImage: empImage,
              empID: empID,
              wanted: _wanted,
              name: name,
              address: address,
              nid: nid,
              bankAcc: bankAcc,
              phone: phone,
              cubit: cubit,
              jobStatus: jobStatus,
              startJob: startJob,
              endJob: endJob,
              endJobReaseon: endJobReaseon);
        }
      },
    );
  }
}
