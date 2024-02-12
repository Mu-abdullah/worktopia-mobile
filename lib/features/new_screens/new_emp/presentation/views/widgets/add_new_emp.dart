import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../../core/widgets/show_progress_indecator.dart';
import '../../manger/new_emp_cubit/new_emp_cubit.dart';
import '../../manger/new_emp_cubit/new_emp_state.dart';
import 'upload_buttons/upload_image.dart';
import 'upload_buttons/upload_info.dart';

class AddNewEmp extends StatefulWidget {
  const AddNewEmp({
    super.key,
    required this.formKey,
    required this.cubit,
    required this.empID,
    required this.phone,
    required this.name,
    required this.address,
    required this.banckAcc,
    required this.nid,
    required this.startJob,
  });
  final GlobalKey<FormState> formKey;
  final NewEmpCubit cubit;
  final TextEditingController empID;
  final TextEditingController phone;
  final TextEditingController name;
  final TextEditingController address;
  final TextEditingController banckAcc;
  final TextEditingController nid;
  final TextEditingController startJob;

  @override
  State<AddNewEmp> createState() => _AddNewEmpState();
}

class _AddNewEmpState extends State<AddNewEmp> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewEmpCubit, NewEmpState>(
      listener: (context, state) {
        if (state is UploadImageLoading) {
          showCustomProgressIndicator(context, "جاري تحميل صورة العامل");
        }
        if (state is UploadImageSuccess) {
          Future.delayed(
              const Duration(
                seconds: 2,
              ), () {
            Navigator.pop(context);
            snackBar(context, contentText: "تم تحميل الصورة بنجاح", seconds: 2);
          });
        }
        if (state is UploadImageFailed) {
          Future.delayed(
              const Duration(
                seconds: 2,
              ), () {
            Navigator.pop(context);
            snackBar(context,
                contentText: "يوجد مشكلة اثناء التحميل", seconds: 2);
          });
        }
      },
      builder: (context, state) {
        NewEmpCubit cubit = NewEmpCubit.get(context);
        return cubit.imageUrl == null
            ? UploadImage(
                cubit: cubit,
                formKey: widget.formKey,
              )
            : UploadUserInfo(
                cubit: cubit,
                formKey: widget.formKey,
                address: widget.address,
                banckAcc: widget.banckAcc,
                empID: widget.empID,
                name: widget.name,
                nid: widget.nid,
                phone: widget.phone,
                startJob: widget.startJob,
              );
      },
    );
  }
}
