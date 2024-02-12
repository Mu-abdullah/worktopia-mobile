import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/functions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.label,
    required this.prefix,
    this.suffix,
    required this.isPassword,
    required this.controller,
    required this.type,
    required this.maxLines,
    this.onChange,
    required this.validate,
    this.onSaved,
    this.onSubmitted,
    this.onTap,
    this.maxLength,
    this.direction,
    this.borderColor = AppColor.blackColor,
    this.textColor = AppColor.blackColor,
  });

  final String hint;
  final String label;

  final Widget prefix;
  final Widget? suffix;
  final bool isPassword;
  final TextDirection? direction;
  final TextEditingController controller;
  final TextInputType type;
  final int maxLines;
  final int? maxLength;
  final Function(String)? onChange;
  final Function(String?)? onSaved;
  final Function()? onTap;
  final Function(String?)? onSubmitted;
  final FormFieldValidator validate;
  final Color borderColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: _fontFamily(),
      onChanged: onChange,
      onSaved: onSaved,
      onTap: onTap,
      onFieldSubmitted: onSubmitted,
      maxLength: maxLength,
      validator: validate,
      obscureText: isPassword,
      controller: controller,
      textDirection: direction,
      keyboardType: type,
      maxLines: maxLines,
      focusNode: FocusNode(),
      decoration: _decoration(),
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.zero,
      hintText: hint,
      hintStyle: _fontFamily(),
      errorStyle: _fontFamily(),
      labelText: label,
      suffix: _suffix(),
      labelStyle: _fontFamily(),
      prefixIcon: prefix,
      border: _borderOutLineBorder(),
      focusedBorder: _focuseOutLineBorder(),
    );
  }

  Padding _suffix() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: suffix,
    );
  }

  OutlineInputBorder _focuseOutLineBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(Constant.radius),
    );
  }

  OutlineInputBorder _borderOutLineBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColor.whiteColor,
      ),
      borderRadius: BorderRadius.circular(Constant.radius),
    );
  }

  TextStyle _fontFamily() {
    return TextStyle(
      color:textColor,
      fontFamily: isEnglish()
          ? Constant.poppEnglishFontFamily
          : Constant.notoArabicFontFamily,
    );
  }
}
