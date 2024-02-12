import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class EditBankAcc extends StatelessWidget {
  const EditBankAcc({
    super.key,
    required this.banckAcc,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController banckAcc;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "رقم الحساب البنكي",
      label: "رقم الحساب البنكي",
      prefix: const Icon(kIsWeb?Icons.credit_card_outlined : Iconsax.bank),
      isPassword: false,
      controller:banckAcc,
      direction: TextDirection.ltr,
      type: TextInputType.number,
      maxLength: 16,
      maxLines: 1,
      validate: (value) {
        if (value.isEmpty) {
          return _wanted;
        }
        if (value.length < 11) {
          return "رقم حساب خاطئ";
        }
        return null;
      },
    );
  }
}