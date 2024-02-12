import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class EmpAddress extends StatelessWidget {
  const EmpAddress({
    super.key,
    required this.address,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController address;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "العنوان",
      label: "العنوان",
      prefix: const Icon(kIsWeb ? Icons.location_on_rounded : Iconsax.location),
      isPassword: false,
      controller: address,
      type: TextInputType.text,
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
