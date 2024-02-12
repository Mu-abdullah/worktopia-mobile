
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'default_texts.dart';

void showCustomProgressIndicator(context, String text) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.navyColor.withOpacity(.7),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.blackColor.withOpacity(.7),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColor.yellowColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TitleText(
                text: text,
                titleColor: AppColor.yellowColor,
              )
            ],
          ),
        ),
      ),
    ),
  );

  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}
