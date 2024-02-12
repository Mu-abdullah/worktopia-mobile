import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class EditSalaryCompForEmp extends StatelessWidget {
  const EditSalaryCompForEmp({
    super.key,
    required this.salaryForCompany,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController salaryForCompany;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "ما يتقاضاه المقاول عن العامل",
      label: "ما يتقاضاه المقاول عن العامل",
      prefix: const Icon(kIsWeb? Icons.money_outlined:Iconsax.dollar_circle),
      isPassword: false,
      controller: salaryForCompany,
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
