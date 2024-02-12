import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class EditExtraDayForEmp extends StatelessWidget {
  const EditExtraDayForEmp({
    super.key,
    required this.extraDayForEmp,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController extraDayForEmp;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "اليوم الاضافي للعامل",
      label: "اليوم الاضافي للعامل",
      prefix: const Icon(kIsWeb? Icons.edit_calendar:Iconsax.calendar_add),
      isPassword: false,
      controller: extraDayForEmp,
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
