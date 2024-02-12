import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/constant.dart';
import '../../manger/new_emp_cubit/new_emp_cubit.dart';
import '../../manger/new_emp_cubit/new_emp_state.dart';
import '../layouts/new_emp_mobile_layouts.dart';
import '../layouts/new_emp_tablet_layouts.dart';
import '../layouts/new_emp_web_layouts.dart';

class NewEmpBody extends StatefulWidget {
  const NewEmpBody({
    super.key,
  });

  @override
  State<NewEmpBody> createState() => _NewEmpBodyState();
}

class _NewEmpBodyState extends State<NewEmpBody> {
  final TextEditingController name = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController startJob = TextEditingController();
  final TextEditingController empID = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController nid = TextEditingController();
  final TextEditingController banckAcc = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewEmpCubit, NewEmpState>(
      builder: (context, state) {
        NewEmpCubit cubit = NewEmpCubit.get(context);
        return SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth <= Constant.mobileWidth) {
                return NewEmpMobileLayouts(
                  formKey: formKey,
                  cubit: cubit,
                  empID: empID,
                  wanted: _wanted,
                  name: name,
                  address: address,
                  phone: phone,
                  nid: nid,
                  banckAcc: banckAcc,
                  startJob: startJob,
                );
              } else if (constraints.maxWidth <= Constant.tabletWidth) {
                return NewEmpTabletLayouts(
                    formKey: formKey,
                    cubit: cubit,
                    empID: empID,
                    wanted: _wanted,
                    name: name,
                    address: address,
                    startJob: startJob,
                    nid: nid,
                    banckAcc: banckAcc,
                    phone: phone);
              } else {
                return NewEmpWebLayouts(
                    formKey: formKey,
                    cubit: cubit,
                    empID: empID,
                    wanted: _wanted,
                    name: name,
                    address: address,
                    startJob: startJob,
                    nid: nid,
                    banckAcc: banckAcc,
                    phone: phone);
              }
            },
          ),
        );
      },
    );
  }

  String get _wanted => "مطلوب";
}
