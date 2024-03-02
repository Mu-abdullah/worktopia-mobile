import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/shared_preferences.dart';

import '../../../../core/helper/cash_helper_data.dart';
import '../../../../core/utils/app_routs.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/size.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../core/widgets/default_texts.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../../../core/widgets/show_progress_indecator.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'widgets/app_image.dart';
import 'widgets/mail.dart';
import 'widgets/password.dart';
import 'widgets/titles.dart';
import 'widgets/user_name_bottom_sheet.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController mail = TextEditingController();

  final TextEditingController password = TextEditingController();
  String error = '';
  var formKey = GlobalKey<FormState>();
  bool remmberMe = false;

  void submitOnBoard() {
    CacheHelper.saveData(
      key: CashHelperData.cashHelperUserKey,
      value: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: _loginListener,
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: LayoutBuilder(
                builder: (context, constraints) {
                  log(constraints.maxWidth);
                  if (constraints.maxWidth <= Constant.mobileWidth) {
                    return _authMobileLayouts(cubit, context);
                  } else if (constraints.maxWidth <= Constant.tabletWidth) {
                    return _authTabletLayouts(context, cubit);
                  } else {
                    return _authWebLayouts(context, cubit);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Center _authWebLayouts(BuildContext context, AuthCubit cubit) {
    return Center(
      child: SizedBox(
        width: CustomSize.width(context, .35),
        child: GlassContainer(
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AppImage(),
                  const SizedBox(height: 50),
                  const TitleAndAdministration(),
                  const SizedBox(height: 20),
                  Mail(mail: mail, wanted: _wanted),
                  const SizedBox(height: 10),
                  Password(password: password, wanted: _wanted),
                  const SizedBox(height: 10),
                  CustomButton(
                    titleColor: AppColor.navyColor,
                    backgroungColor: AppColor.yellowColor,
                    buttonName: "تسجيل الدخول",
                    onPress: () async {
                      if (formKey.currentState!.validate()) {
                        cubit.auth(
                          mail: mail.text,
                          password: password.text,
                        );
                        CacheHelper.saveData(
                          key: CashHelperData.cashHelperUserMailKey,
                          value: mail.text,
                        );
                        FocusScope.of(context).unfocus();
                      }
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: remmberMe,
                        activeColor: AppColor.yellowColor,
                        checkColor: AppColor.navyColor,
                        shape: const CircleBorder(eccentricity: .5),
                        onChanged: (bool? value) {
                          setState(() {
                            remmberMe = value!;
                          });
                        },
                      ),
                      const TitleText(
                        text: "تذكرني",
                        isTitle: false,
                        // subTitleColor: AppColor.whiteColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center _authTabletLayouts(BuildContext context, AuthCubit cubit) {
    return Center(
      child: SizedBox(
        width: CustomSize.width(context, .7),
        height: CustomSize.height(context, 1),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AppImage(),
                  const SizedBox(height: 50),
                  const TitleAndAdministration(),
                  const SizedBox(height: 20),
                  Mail(mail: mail, wanted: _wanted),
                  const SizedBox(height: 10),
                  Password(password: password, wanted: _wanted),
                  const SizedBox(height: 10),
                  CustomButton(
                    titleColor: AppColor.navyColor,
                    backgroungColor: AppColor.yellowColor,
                    buttonName: "تسجيل الدخول",
                    onPress: () async {
                      if (formKey.currentState!.validate()) {
                        cubit.auth(
                          mail: mail.text,
                          password: password.text,
                        );
                        CacheHelper.saveData(
                          key: CashHelperData.cashHelperUserMailKey,
                          value: mail.text,
                        );
                        FocusScope.of(context).unfocus();
                      }
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: remmberMe,
                        activeColor: AppColor.yellowColor,
                        checkColor: AppColor.navyColor,
                        shape: const CircleBorder(eccentricity: .5),
                        onChanged: (bool? value) {
                          setState(() {
                            remmberMe = value!;
                          });
                        },
                      ),
                      const TitleText(
                        text: "تذكرني",
                        isTitle: false,
                        // subTitleColor: AppColor.whiteColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _authMobileLayouts(
      AuthCubit cubit, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppImage(),
              const SizedBox(height: 50),
              const TitleAndAdministration(),
              const SizedBox(height: 20),
              Mail(mail: mail, wanted: _wanted),
              const SizedBox(height: 10),
              Password(password: password, wanted: _wanted),
              const SizedBox(height: 10),
              CustomButton(
                titleColor: AppColor.navyColor,
                backgroungColor: AppColor.yellowColor,
                buttonName: "تسجيل الدخول",
                onPress: () async {
                  if (formKey.currentState!.validate()) {
                    cubit.auth(
                      mail: mail.text,
                      password: password.text,
                    );
                    CacheHelper.saveData(
                      key: CashHelperData.cashHelperUserMailKey,
                      value: mail.text,
                    );
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
              Row(
                children: [
                  Checkbox(
                    value: remmberMe,
                    activeColor: AppColor.yellowColor,
                    checkColor: AppColor.navyColor,
                    shape: const CircleBorder(eccentricity: .5),
                    onChanged: (bool? value) {
                      setState(() {
                        remmberMe = value!;
                      });
                    },
                  ),
                  const TitleText(
                    text: "تذكرني",
                    isTitle: false,
                    // subTitleColor: AppColor.whiteColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginListener(context, state) {
    if (state is LoadingAuth) {
      showCustomProgressIndicator(context: context, text: "جاري تسجيل الدخول");
    }
    if (state is SuccessAuth) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Navigator.pop(context);
          if (remmberMe == true) {
            submitOnBoard();
          }
          if (CashHelperData.cashHelperUserNameValue == null) {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              isScrollControlled: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              builder: (context) => const UserNameBottomSheet(),
            );
          } else {
            GoRouter.of(context).push(AppRouter.newHomeScreen);
            snackBar(
              context,
              contentText: "تم تسجيل الدخول بنجاح",
              background: AppColor.yellowColor,
              contentColor: AppColor.navyColor,
              seconds: 3,
            );
          }
        },
      );
    }
    if (state is FailedAuth) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Navigator.pop(context);
          if (kDebugMode) {
            print(state.error);
          }
          snackBar(
            context,
            contentText: "لم يتم تسجيل الدخول بنجاح برجاء المحاولة مرة اخرى",
            background: AppColor.yellowColor,
            contentColor: AppColor.navyColor,
            seconds: 3,
          );
        },
      );
    }
  }

  String get _wanted => "مطلوب";
}
