import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String randomId = generateDocumentId();

String generateDocumentId() {
  final random = Random();
  return '${random.nextInt(99999)}';
}

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

bool isEnglish() {
  return Intl.getCurrentLocale() == 'en';
}

arabicOnly(value, {required contrroler}) {
  if (value.isNotEmpty) {
    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(value)) {
      // إذا لم تكن القيمة تحتوي على حروف فقط، قم بإزالة آخر حرف تم إدخاله
      contrroler.text =
          contrroler.text.substring(0, contrroler.text.length - 1);
    }
  }
}

numberOnly(value, {required contrroler}) {
  if (value.isNotEmpty) {
    if (double.tryParse(value) == null) {
      // If not a number, remove the last entered character
      contrroler.text =
          contrroler.text.substring(0, contrroler.text.length - 1);
    }
  }
}
