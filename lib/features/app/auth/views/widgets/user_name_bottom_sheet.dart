
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/helper/cash_helper_data.dart';
import '../../../../../../core/helper/shared_preferences.dart';
import '../../../../../core/utils/app_routs.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class UserNameBottomSheet extends StatefulWidget {
  const UserNameBottomSheet({
    super.key,
  });

  @override
  State<UserNameBottomSheet> createState() => _UserNameBottomSheetState();
}

class _UserNameBottomSheetState extends State<UserNameBottomSheet> {
  final TextEditingController name = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 16,
          right: 16,
          left: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: formKey,
              child: CustomTextField(
                  hint: "يفضل كتابة الاسم باللغة العربية",
                  label: "الاسم",
                  prefix: const Icon(kIsWeb?Icons.verified_user_outlined: Iconsax.user),
                  isPassword: false,
                  controller: name,
                  type: TextInputType.name,
                  maxLines: 1,
                  validate: (vale) {
                    if (vale.isEmpty) {
                      return "الاسم مطلوب";
                    }
                    return null;
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              buttonName: "تسجيل الاسم",
              backgroungColor: AppColor.yellowColor,
              titleColor: AppColor.navyColor,
              onPress: () {
                if (formKey.currentState!.validate()) {
                  CacheHelper.saveData(
                    key: CashHelperData.cashHelperUserNameKey,
                    value: name.text,
                  ).then((value) {
                    Navigator.pop(context);
                    snackBar(context,
                        contentText: "تم تسجيل الاسم بنجاح", seconds: 3);
                    GoRouter.of(context).pushReplacement(AppRouter.homeScreen);
                  });
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
