import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class DepartmentExtraDayForCompany extends StatelessWidget {
  const DepartmentExtraDayForCompany({
    super.key,
    required this.extraDayForCompany,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController extraDayForCompany;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "اليوم الاضافي للمقاول",
      label: "اليوم الاضافي للمقاول",
      prefix: const Icon(Iconsax.calendar_add),
      isPassword: false,
      controller: extraDayForCompany,
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
