import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class EmpNID extends StatelessWidget {
  const EmpNID({
    super.key,
    required this.nid,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController nid;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "الرقم القومي",
      label: "الرقم القومي",
      prefix: const Icon(kIsWeb ? Icons.credit_card_outlined :Iconsax.card),
      isPassword: false,
      controller: nid,
      direction: TextDirection.ltr,
      type: TextInputType.number,
      maxLines: 1,
      maxLength: 14,
      validate: (value) {
        if (value.isEmpty) {
          return _wanted;
        }
        if (value.length < 14) {
          return "رقم قومي خاطئ";
        }
        return null;
      },
    );
  }
}
