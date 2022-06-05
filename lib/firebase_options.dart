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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCuGFCpUJdJsGA3taiMjz8-pt_sgZMhIUI',
    appId: '1:552763750242:web:03a6504e79ce27c67bde3b',
    messagingSenderId: '552763750242',
    projectId: 'tranzact-a648a',
    authDomain: 'tranzact-a648a.firebaseapp.com',
    storageBucket: 'tranzact-a648a.appspot.com',
    measurementId: 'G-8MWZ662S7S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBs4MHKcybCIoEp2S8yH_OlbdrWOQDAMsM',
    appId: '1:552763750242:android:e063c843666665627bde3b',
    messagingSenderId: '552763750242',
    projectId: 'tranzact-a648a',
    storageBucket: 'tranzact-a648a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6Afwh_p6Yor0-BrFWX4ORyb2xEBgL38Y',
    appId: '1:552763750242:ios:7d4f6bfd374db9057bde3b',
    messagingSenderId: '552763750242',
    projectId: 'tranzact-a648a',
    storageBucket: 'tranzact-a648a.appspot.com',
    androidClientId: '552763750242-70ch6p9amhd91lrfod2teueadck1372b.apps.googleusercontent.com',
    iosClientId: '552763750242-s5mn5ljqm437icuj9irae9fb0pana861.apps.googleusercontent.com',
    iosBundleId: 'com.example.tranzact',
  );
}
