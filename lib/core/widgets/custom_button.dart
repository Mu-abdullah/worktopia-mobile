import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/colors.dart';
import '../utils/size.dart';
import 'default_texts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPress,
    required this.buttonName,
    this.width = 1,
    this.borderWidth = 1,
    this.fontsize = 18,
    this.titleColor = AppColor.babyBlueColor,
    this.backgroungColor = AppColor.navyColor,
    this.borderColor = AppColor.navyColor,
    this.loadingState = false,
    this.needIcon = false,
    this.isUpperCase = false,
    this.needBorder = false,
    this.icon = Iconsax.activity,
  });

  final Function() onPress;
  final String buttonName;

  final IconData? icon;
  final double width;
  final double borderWidth;
  final double fontsize;
  final Color titleColor;
  final Color backgroungColor;
  final Color borderColor;
  final bool needBorder;
  final bool loadingState;
  final bool needIcon;
  final bool isUpperCase;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: loadingState
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColor.whiteColor,
              ),
            )
          : _activeButton(context),
    );
  }

  Container _activeButton(BuildContext context) {
    return Container(
      width: CustomSize.width(context, width),
      decoration: _buttonDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: needIcon
                ? Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TitleText(
                          isTitle: true,
                          text: isUpperCase
                              ? buttonName.toUpperCase()
                              : buttonName,
                          titleColor: needBorder ? borderColor : titleColor,
                          titleSize: fontsize,
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          icon,
                          color: needBorder ? borderColor : titleColor,
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.zero,
                    child: TitleText(
                      isTitle: true,
                      text: isUpperCase ? buttonName.toUpperCase() : buttonName,
                      titleColor: needBorder ? borderColor : titleColor,
                      titleSize: fontsize,
                    ),
                  )),
      ),
    );
  }

  BoxDecoration _buttonDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: needBorder ? titleColor : backgroungColor,
        border: needBorder
            ? Border.all(
                color: borderColor,
                width: borderWidth,
              )
            : Border.all(
                color: backgroungColor,
                width: borderWidth,
              ));
  }
}
