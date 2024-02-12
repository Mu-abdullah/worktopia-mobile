import 'shared_preferences.dart';

class CashHelperData {
  

  static const String cashHelperLanguageKey = "Language";
  static String? cashHelperLanguageValue =
      CacheHelper.getData(key: cashHelperLanguageKey);


  static const String cashHelperUserKey = "user";
  static bool? cashHelperUserValue =
      CacheHelper.getData(key: cashHelperUserKey);


  static const String cashHelperUserNameKey = "userName";
  static String? cashHelperUserNameValue =
      CacheHelper.getData(key: cashHelperUserNameKey);    

  static const String cashHelperUserMailKey = "userMail";
  static String? cashHelperUserMailValue =
      CacheHelper.getData(key: cashHelperUserMailKey);    
}
