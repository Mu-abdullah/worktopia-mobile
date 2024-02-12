// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyChiF8rYqjajCF3uCfZvghdvtwrkMCZ0kQ',
    appId: '1:360402965589:web:5eaab9bd901bbce9d930dc',
    messagingSenderId: '360402965589',
    projectId: 'thehive-220c0',
    authDomain: 'thehive-220c0.firebaseapp.com',
    storageBucket: 'thehive-220c0.appspot.com',
    measurementId: 'G-LHJ452XVSW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfx96QRQZobWyHt5yqzN-PbMfiuigH9Ug',
    appId: '1:360402965589:android:6bae394ba1be239ad930dc',
    messagingSenderId: '360402965589',
    projectId: 'thehive-220c0',
    storageBucket: 'thehive-220c0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1RKa41oM5kPotpLIHyqBHV4LtvaTCGIg',
    appId: '1:360402965589:ios:ad1ecc8393f36323d930dc',
    messagingSenderId: '360402965589',
    projectId: 'thehive-220c0',
    storageBucket: 'thehive-220c0.appspot.com',
    iosBundleId: 'com.abdullah.sidpec.the.hive.theHive',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1RKa41oM5kPotpLIHyqBHV4LtvaTCGIg',
    appId: '1:360402965589:ios:1e117f14e7066d98d930dc',
    messagingSenderId: '360402965589',
    projectId: 'thehive-220c0',
    storageBucket: 'thehive-220c0.appspot.com',
    iosBundleId: 'com.abdullah.sidpec.the.hive.theHive.RunnerTests',
  );
}
