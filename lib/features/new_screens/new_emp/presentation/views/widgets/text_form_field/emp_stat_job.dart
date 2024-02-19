
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class EmpStartJob extends StatelessWidget {
  const EmpStartJob({
    super.key,
    required this.startJob,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController startJob;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: startJob,
      isPassword: false,
      hint: "بداية العمل",
      label: "بداية العمل",
      maxLines: 1,
      prefix: const Icon(kIsWeb ? Icons.calendar_today_outlined : Iconsax.calendar),
      type: TextInputType.datetime,
      validate: (value) {
        if (value.isEmpty) {
          return _wanted;
        }
        return null;
      },
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.parse("2000-01-01"),
                lastDate: DateTime.parse('2060-12-31'))
            .then((value) {
          startJob.text = DateFormat.yMMMd().format(value!);
        });
      },
    );
  }
}