import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class EditEmpID extends StatelessWidget {
  const EditEmpID({
    super.key,
    required this.empID,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController empID;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "رقم القيد",
      label: "رقم القيد",
      prefix: const Icon(kIsWeb? Icons.numbers : Iconsax.hashtag),
      isPassword: false,
      controller: empID,
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
