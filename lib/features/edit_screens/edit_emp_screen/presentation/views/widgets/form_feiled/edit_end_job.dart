import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';
import '../../../manger/cubit/edit_emp_cubit.dart';

class EditEndJob extends StatelessWidget {
  const EditEndJob({
    super.key,
    required this.endJob,
    required String wanted,
    required this.cubit,
  }) : _wanted = wanted;

  final TextEditingController endJob;
  final String _wanted;
  final EditEmpCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomTextField(
        controller: endJob,
        isPassword: false,
        hint: "نهاية العمل",
        label: "نهاية العمل",
        maxLines: 1,
        prefix: const Icon(kIsWeb? Icons.calendar_today_outlined :Iconsax.calendar),
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
            endJob.text = DateFormat.yMMMd().format(value!);
          });
        },
      ),
    );
  }
}
