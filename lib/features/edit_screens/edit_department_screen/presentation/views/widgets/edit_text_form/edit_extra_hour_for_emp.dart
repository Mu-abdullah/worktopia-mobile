import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class EditExtraHourForEmp extends StatelessWidget {
  const EditExtraHourForEmp({
    super.key,
    required this.extraHourForEmp,
    required String wanted,
    required this.extraNightShiftHourForEmp,
  }) : _wanted = wanted;

  final TextEditingController extraHourForEmp;
  final String _wanted;
  final TextEditingController extraNightShiftHourForEmp;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            hint: "الساعة النهاري",
            label: "الساعة النهاري",
            prefix: const Icon(kIsWeb? Icons.watch:Iconsax.watch),
            isPassword: false,
            controller: extraHourForEmp,
            type: TextInputType.number,
            maxLines: 1,
            validate: (value) {
              if (value.isEmpty) {
                return _wanted;
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomTextField(
            hint: "الساعة الليلي",
            label: "الساعة الليلي",
            prefix: const Icon(kIsWeb? Icons.watch:Iconsax.watch),
            isPassword: false,
            controller: extraNightShiftHourForEmp,
            type: TextInputType.number,
            maxLines: 1,
            validate: (value) {
              if (value.isEmpty) {
                return _wanted;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
