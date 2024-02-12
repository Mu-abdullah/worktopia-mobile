import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/utils/size.dart';
import '../../../../../../core/widgets/default_texts.dart';
import '../../../../../../generated/l10n.dart';

class SearchContainerButton extends StatelessWidget {
  const SearchContainerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Container(
        width: CustomSize.width(context, 1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constant.radius),
            color: AppColor.babyBlueColor.withOpacity(0.5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              const SizedBox(width: 10),
              const Icon(Iconsax.search_normal),
              const SizedBox(width: 10),
              TitleText(
                text: S.current.searchText,
                isTitle: false,
                subTitleColor: AppColor.blackColor.withOpacity(.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
