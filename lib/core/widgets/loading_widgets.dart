
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/size.dart';
import 'default_texts.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: CustomSize.height(context, .3)),
          Center(
            child: Container(
              width: CustomSize.width(context, .6),
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
                    const TitleText(
                      text: "جاري تحميل البيانات",
                      titleColor: AppColor.yellowColor,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
