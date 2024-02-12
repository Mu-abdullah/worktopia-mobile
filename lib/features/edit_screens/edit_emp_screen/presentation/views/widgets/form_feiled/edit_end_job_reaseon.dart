import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';
import '../../../manger/cubit/edit_emp_cubit.dart';

class EndJobReaseon extends StatelessWidget {
  const EndJobReaseon({
    super.key,
    required this.cubit,
    required this.endJobReaseon,
    required String wanted,
  }) : _wanted = wanted;

  final EditEmpCubit cubit;
  final TextEditingController endJobReaseon;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        child: CustomTextField(
            hint: "سبب انهاء العمل",
            label: "سبب انهاء العمل",
            prefix: const Icon(kIsWeb? Icons.receipt_outlined :Iconsax.receipt),
            isPassword: false,
            controller: endJobReaseon,
            type: TextInputType.text,
            maxLines: 5,
            validate: (value) {
              if (value.isEmpty) {
                return _wanted;
              }
              return null;
            }),
      ),
    );
  }
}
