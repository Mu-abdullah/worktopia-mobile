import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class EmpName extends StatelessWidget {
  const EmpName({
    super.key,
    required this.name,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController name;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "الاسم",
      label: "الاسم",
      prefix: const Icon(kIsWeb ? Icons.person : Iconsax.user),
      isPassword: false,
      controller: name,
      type: TextInputType.name,
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