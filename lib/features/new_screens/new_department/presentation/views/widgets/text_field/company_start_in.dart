import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class CompanyStartIn extends StatelessWidget {
  const CompanyStartIn({
    super.key,
    required this.startIn,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController startIn;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "بداية العقد",
      label: "بداية العقد",
      prefix: const Icon(Iconsax.calendar),
      isPassword: false,
      controller: startIn,
      type: TextInputType.datetime,
      maxLines: 1,
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.parse("2020-01-01"),
                lastDate: DateTime.parse('2030-12-31'))
            .then((value) {
          startIn.text = DateFormat.yMMMd().format(value!);
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
