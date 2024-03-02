import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/entities/department_model.dart';
import '../../../../../../core/utils/app_routs.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'company_details_card.dart';

class DepartmentDetilesScreen extends StatefulWidget {
  const DepartmentDetilesScreen({
    super.key,
    required this.model,
  });

  final DepartmentsModel model;

  @override
  State<DepartmentDetilesScreen> createState() =>
      _DepartmentDetilesScreenState();
}

class _DepartmentDetilesScreenState extends State<DepartmentDetilesScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              CompanyDetails(widget: widget),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                      onPress: () {
                        Navigator.pop(context);
                      },
                      buttonName: "إغلاق",
                      needIcon: true,
                      icon: kIsWeb ? Icons.close : Iconsax.close_square,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: CustomButton(
                      onPress: () {
                        Navigator.pop(context);
                        GoRouter.of(context).push(
                            AppRouter.editeDepartmentScreen,
                            extra: widget.model);
                      },
                      buttonName: "تعديل",
                      needBorder: true,
                      needIcon: true,
                      icon: kIsWeb ? Icons.edit : Iconsax.edit,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
