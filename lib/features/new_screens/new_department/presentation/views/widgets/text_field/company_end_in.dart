import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class CompanyEndtIn extends StatelessWidget {
  const CompanyEndtIn({
    super.key,
    required this.endIn,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController endIn;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "نهاية العقد",
      label: "نهاية العقد",
      prefix: const Icon(Iconsax.calendar),
      isPassword: false,
      controller: endIn,
      type: TextInputType.datetime,
      maxLines: 1,
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.parse("2020-01-01"),
                lastDate: DateTime.parse('2030-12-31'))
            .then((value) {
          endIn.text = DateFormat.yMMMd().format(value!);
        });
      },
      validate: (value) {
        if (value.isEmpty) {
          return _wanted;
        }
        return null;
      },
    );
  }
}
