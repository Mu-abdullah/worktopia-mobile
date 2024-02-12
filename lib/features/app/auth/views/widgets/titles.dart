import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/widgets/default_texts.dart';

class TitleAndAdministration extends StatelessWidget {
  const TitleAndAdministration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: TitleText(
            text: "الإدارة العامة للخدمات الإدارية",
            // titleColor: AppColor.whiteColor,
            titleSize:kIsWeb? 21 :28,
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: TitleText(
            text: "العمالة المؤقتة",
            titleSize:kIsWeb? 21 :28,
            // titleColor: AppColor.whiteColor,
          ),
        ),
      ],
    );
  }
}