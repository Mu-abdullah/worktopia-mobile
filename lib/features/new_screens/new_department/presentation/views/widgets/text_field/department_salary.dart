import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class DepartmentSalary extends StatelessWidget {
  const DepartmentSalary({
    super.key,
    required this.salary,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController salary;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "الراتب",
      label: "الراتب",
      prefix: const Icon(Iconsax.dollar_circle),
      isPassword: false,
      controller: salary,
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
