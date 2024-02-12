import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class EmpPhone extends StatelessWidget {
  const EmpPhone({
    super.key,
    required this.phone,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController phone;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "رقم الهاتف",
      label: "رقم الهاتف",
      prefix: const Icon(kIsWeb ? Icons.phone_android :Iconsax.mobile),
      isPassword: false,
      controller: phone,
      direction: TextDirection.ltr,
      type: TextInputType.number,
      maxLength: 11,
      maxLines: 1,
      validate: (value) {
        if (value.isEmpty) {
          return _wanted;
        }
        if (value.length < 11) {
          return "رقم هاتف خاطئ";
        }
        return null;
      },
    );
  }
}
