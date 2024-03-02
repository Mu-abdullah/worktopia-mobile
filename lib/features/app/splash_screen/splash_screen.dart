
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/helper/cash_helper_data.dart';
import '../../../core/utils/app_routs.dart';
import '../../../core/utils/asset_data.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/size.dart';
import '../../../core/widgets/default_texts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String text = "";
  String text2 = "";
  @override
  void initState() {
    super.initState();
    showName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Center(
            child: Image.asset(
              AssetDate.logo,
              width: CustomSize.height(context, .3),
            ),
          ),
          Center(child: TitleText(text: text)),
          const SizedBox(height: 10),
          Center(child: TitleText(text: text2)),
          const Spacer(),
          const Center(child: CircularProgressIndicator()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  showName() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          text = "الإدارة العامة للخدمات الإدارية";
        });
      },
    );
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          text2 = "بيانات العمالة المؤقتة بشركة سيدبك";
        });
      },
    );
    Future.delayed(
      const Duration(seconds: 3),
      () {
        FirebaseAuth.instance.authStateChanges().listen((user) {
          if (user != null && CashHelperData.cashHelperUserValue != null) {
            GoRouter.of(context).pushReplacement(AppRouter.newHomeScreen);
          } else {
            GoRouter.of(context).pushReplacement(AppRouter.authScreen);
          }
        });
      },
    );
  }
}
