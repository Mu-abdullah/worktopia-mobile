import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';

class EditIncentive extends StatelessWidget {
  const EditIncentive({
    super.key,
    required this.incetive,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController incetive;
  final String _wanted;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "المنحة الشهرية",
      label: "المنحة الشهرية",
      prefix: const Icon(kIsWeb? Icons.account_balance_wallet_outlined:Iconsax.wallet_add),
      isPassword: false,
      controller: incetive,
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
