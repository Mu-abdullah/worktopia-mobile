import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../core/helper/cash_helper_data.dart';
import '../../../../../../../core/helper/shared_preferences.dart';
import '../../../../../../../core/utils/app_routs.dart';
import '../../../../../../../core/utils/asset_data.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../core/widgets/default_texts.dart';
import '../../../../../../../core/widgets/divider.dart';
import 'drawer_listview.dart';

class DrawerWidgets extends StatelessWidget {
  const DrawerWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              const TitleText(text: "الإدارة العامة للخدمات الإدارية"),
              const CustomDivider(
                color: AppColor.yellowColor,
              ),
              const DrawerListView(),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  final String message =
                      "إعادة تعيين كلمة المرور الخاص بالإيميل ${CashHelperData.cashHelperUserMailValue}";
                  final Uri uri = Uri.parse(
                      "https://wa.me/+2${AssetDate.appCall}?text=$message");
                  _launchLink(url: uri);
                },
                child: const TitleText(
                  text: "إعادة تعيين كلمة المرور",
                  isTitle: false,
                ),
              ),
              const CustomDivider(
                color: AppColor.yellowColor,
              ),
              CustomButton(
                onPress: () async {
                  signOut(context);
                  await FirebaseAuth.instance.signOut();
                },
                buttonName: "تسجيل خروج",
                backgroungColor: AppColor.navyColor,
                titleColor: AppColor.whiteColor,
              ),
            ],
          ),
        ));
  }

  void signOut(context) {
    CacheHelper.removeData(key: CashHelperData.cashHelperUserKey);
    CacheHelper.removeData(key: CashHelperData.cashHelperUserMailKey);

    GoRouter.of(context).pushReplacement(AppRouter.splashScreen);
  }

  Future<void> _launchLink({required Uri url}) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
