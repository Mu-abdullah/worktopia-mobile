
import 'package:flutter/material.dart';

import '../../../../../../core/utils/asset_data.dart';
import '../../../../../../core/utils/size.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Image.asset(
        AssetDate.logo,
        width: CustomSize.height(context, .2),
      ),
    );
  }
}
