import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/utils/app_routs.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../emp_details_screen.dart';

class BottomSheetsButtons extends StatelessWidget {
  const BottomSheetsButtons({
    super.key,
    required this.widget,
  });

  final EmpDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: CustomButton(
            onPress: () {
              Navigator.pop(context);
            },
            buttonName: "اغلاق",
            needIcon: true,
            icon: kIsWeb ? Icons.close : Iconsax.close_square,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: 2,
          child: CustomButton(
            onPress: () {
              Navigator.pop(context);
              GoRouter.of(context)
                  .push(AppRouter.editEmpScreen, extra: widget.model);
            },
            buttonName: "تعديل",
            needBorder: true,
            needIcon: true,
            icon: kIsWeb ? Icons.edit : Iconsax.edit,
          ),
        )
      ],
    );
  }
}
