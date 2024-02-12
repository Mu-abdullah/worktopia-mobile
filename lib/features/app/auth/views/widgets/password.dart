import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/widgets/custom_text_field.dart';

class Password extends StatefulWidget {
  const Password({
    super.key,
    required this.password,
    required String wanted,
  }) : _wanted = wanted;

  final TextEditingController password;
  final String _wanted;

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "كلمة المرور",
      label: "كلمة المرور",
      prefix: const Icon(kIsWeb ? Icons.lock_outline : Iconsax.lock),
      isPassword: isPassword,
      controller: widget.password,
      suffix: InkWell(
        onTap: () {
          setState(() {
            isPassword = !isPassword;
          });
        },
        child:kIsWeb ?Icon(isPassword ? Icons.visibility : Icons.visibility_off) : Icon(isPassword ? Iconsax.eye : Iconsax.eye_slash),
      ),
      type: TextInputType.visiblePassword,
      maxLines: 1,
      validate: (value) {
        if (value.isEmpty) {
          return widget._wanted;
        }
        return null;
      },
    );
  }
}
