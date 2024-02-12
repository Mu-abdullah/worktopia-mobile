import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class CompanySalaryForEmp extends StatelessWidget {
  const CompanySalaryForEmp({
    super.key,
    required this.companySalaryForEmp,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController companySalaryForEmp;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "ما يتقاضاه المقاول عن العامل",
      label:"ما يتقاضاه المقاول عن العامل",
      prefix: const Icon(Iconsax.dollar_circle),
      isPassword: false,
      controller: companySalaryForEmp,
      type: TextInputType.number,
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
