import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../core/widgets/custom_snack_bar.dart';
import '../../../manger/new_emp_cubit/new_emp_cubit.dart';
import '../../../manger/new_emp_cubit/new_emp_state.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({
    super.key,
    required this.cubit,
    required this.formKey,
  });

  final NewEmpCubit cubit;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewEmpCubit, NewEmpState>(
      listener: (context, state) {},
      child: CustomButton(
        width: kIsWeb ? .35 : 1,
        onPress: () {
          if (!kIsWeb) {
            if (cubit.image == null || cubit.departmentValue == null) {
              snackBar(context, contentText: "اختار الصورة والقسم", seconds: 2);
            } else {
              cubit.uploadPhotoFromAndroid(department: cubit.departmentValue!);
            }
          } else {
            if (cubit.pickedBytes == null || cubit.departmentValue == null) {
              snackBar(context, contentText: "اختار الصورة والقسم", seconds: 2);
            } else {
              cubit.uploadPhotoFromWeb(department: cubit.departmentValue!);
            }
          }
        },
        backgroungColor:
            kIsWeb ? _webBackgroundColor() : _androidBackgroundColor(),
        titleColor: kIsWeb ? _webTitleColor() : _androidTitleColor(),
        buttonName: kIsWeb ? _webButtonName() : _androidButtonName(),
      ),
    );
  }

  Color _androidTitleColor() =>
      cubit.image == null ? AppColor.whiteColor : AppColor.blackColor;

  Color _webTitleColor() =>
      cubit.pickedBytes == null ? AppColor.whiteColor : AppColor.blackColor;

  Color _androidBackgroundColor() {
    return cubit.image == null
        ? AppColor.blackColor.withOpacity(.5)
        : AppColor.yellowColor;
  }

  Color _webBackgroundColor() {
    return cubit.pickedBytes == null
        ? AppColor.blackColor.withOpacity(.5)
        : AppColor.yellowColor;
  }

  String _androidButtonName() =>
      cubit.image == null ? "اختار صورة" : "اضافة الصورة";

  String _webButtonName() =>
      cubit.pickedBytes == null ? "اختار صورة" : "اضافة الصورة";
}
