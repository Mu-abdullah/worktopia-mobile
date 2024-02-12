import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

import '../../generated/l10n.dart';
import '../helper/cash_helper_data.dart';
import '../helper/shared_preferences.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/functions.dart';
import 'default_texts.dart';
import 'divider.dart';

class ChangeLang extends StatefulWidget {
  const ChangeLang({
    super.key,
    required this.screenAppRouter,
  });
  final String screenAppRouter;

  @override
  State<ChangeLang> createState() => _ChangeLangState();
}

class _ChangeLangState extends State<ChangeLang> {
  String selectedValue = "";
  @override
  void initState() {
    super.initState();
    if (CashHelperData.cashHelperLanguageValue != null) {
      selectedValue = CashHelperData.cashHelperLanguageValue!;
    } else {
      selectedValue = "";
    }
  }

  void submitOnBoard(selectedValue) {
    CacheHelper.saveData(
      key: CashHelperData.cashHelperLanguageKey,
      value: selectedValue,
    );
  }

// Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(String val) {
    setState(() {
      selectedValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    const String arabic = "عربي";
    const String english = "English";
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleText(
          text: S.current.changeLanguage,
          titleSize: 28,
        ),
        const CustomDivider(
          indent: 0,
          endIndent: 50,
        ),
        SizedBox(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                if (index == 0) {
                  setSelectedRadio("ar");
                } else {
                  setSelectedRadio("en");
                }
              },
              title: Text(
                index == 0 ? arabic : english,
                style: TextStyle(
                  fontFamily: index == 0
                      ? Constant.notoArabicFontFamily
                      : Constant.poppEnglishFontFamily,
                  fontWeight: FontWeight.w900,
                ),
              ),
              leading: Radio(
                value: index == 0 ? "ar" : "en",
                groupValue: selectedValue,
                onChanged: (value) {
                  setSelectedRadio(value!);
                },
              ),
            );
          },
        )),
        Align(
          alignment: isEnglish() ? Alignment.centerRight : Alignment.bottomLeft,
          child: TextButton(
            onPressed: () {
              if (selectedValue == "") {
                Navigator.pop(context);
              } else if (selectedValue !=
                  CashHelperData.cashHelperLanguageValue) {
                submitOnBoard(selectedValue);
                Restart.restartApp(webOrigin: widget.screenAppRouter);
              } else {
                Navigator.pop(context);
              }
            },
            child: TitleText(
              text: S.current.continueText,
              isTitle: false,
              subTitleColor: AppColor.navyColor,
            ),
          ),
        ),
      ],
    );
  }
}
