import 'package:flutter/material.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../../../../data/model/drawer_model.dart';

class DrawerListViewItem extends StatelessWidget {
  const DrawerListViewItem({
    super.key,
    required this.model,
  });
  final DrawerModel model;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: model.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                model.leading,
                color: AppColor.navyColor,
              ),
              const SizedBox(width: 10),
              TitleText(
                text: model.buttonName!,
                titleColor: AppColor.navyColor,
              ),
              const Spacer(),
              Icon(
                model.trailing,
                color: AppColor.navyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
