import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/widgets/custom_text_field.dart';

class Mail extends StatelessWidget {
  const Mail({
    super.key,
    required this.mail,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController mail;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "البريد الإلكتروني",
      label: "البريد الإلكتروني",
      prefix: const Icon(kIsWeb ? Icons.person_outline : Iconsax.user),
      isPassword: false,
      controller: mail,
      // borderColor: AppColor.whiteColor,
      // textColor: AppColor.whiteColor,
      type: TextInputType.emailAddress,
      maxLines: 1,
      validate: (value) {
        if (value.isEmpty) {
          return _wanted;
        }
        return null;
      },
    );
  }
}
