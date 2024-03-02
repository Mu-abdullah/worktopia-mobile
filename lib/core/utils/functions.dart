import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helper/firebase_names.dart';
import 'tables_name.dart';

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

String jobStatus({required String model}) {
  if (model == FBFirestoreName.empJobStatusResigned) {
    return "استقالة";
  }
  if (model == FBFirestoreName.empJobStatusTermination) {
    return "استبعاد";
  } else {
    return "على قوة العمل";
  }
}


String collectionID(scoop) {
    if (scoop == TableName.supplyEmp) {
      return FBFirestoreName.dDocumentSupplyEmp;
    } else if (scoop == TableName.buffet) {
      return FBFirestoreName.dDocumentBuffet;
    } else if (scoop == TableName.clean) {
      return FBFirestoreName.dDocumentClean;
    } else if (scoop == TableName.farm) {
      return FBFirestoreName.dDocumentZra3a;
    } else {
      return FBFirestoreName.dDocumentAntiReed;
    }
  }

