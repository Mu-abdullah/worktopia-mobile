import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class EditEndIn extends StatelessWidget {
  const EditEndIn({
    super.key,
    required this.companyEndIn,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController companyEndIn;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "نهاية العقد",
      label: "نهاية العقد",
      prefix: const Icon(kIsWeb? Icons.calendar_today_outlined: Iconsax.calendar),
      isPassword: false,
      controller: companyEndIn,
      type: TextInputType.datetime,
      maxLines: 1,
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.parse("2020-01-01"),
                lastDate: DateTime.parse('2030-12-31'))
            .then((value) {
          companyEndIn.text = DateFormat.yMMMd().format(value!);
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
