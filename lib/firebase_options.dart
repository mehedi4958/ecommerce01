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
    apiKey: 'AIzaSyCZ7oAnvcLhkT-TQ0zdtvQFezXlnLx5XS4',
    appId: '1:356135539437:web:e92ebd6df17d73bb20f2e4',
    messagingSenderId: '356135539437',
    projectId: 'ecommerce01-71300',
    authDomain: 'ecommerce01-71300.firebaseapp.com',
    storageBucket: 'ecommerce01-71300.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACMPM9kY3ON3RInXO7F3HN2HBlCfjEQ6U',
    appId: '1:356135539437:android:f35702028b66a18820f2e4',
    messagingSenderId: '356135539437',
    projectId: 'ecommerce01-71300',
    storageBucket: 'ecommerce01-71300.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATy1vmk8ZZUAx-ZAeIc441dtrTRPrltzg',
    appId: '1:356135539437:ios:966e085bdbd8d02320f2e4',
    messagingSenderId: '356135539437',
    projectId: 'ecommerce01-71300',
    storageBucket: 'ecommerce01-71300.appspot.com',
    androidClientId: '356135539437-f4fmjbeekshcm2ngsa7bmo80226p3vis.apps.googleusercontent.com',
    iosClientId: '356135539437-dsrien536odbeklkqtah5nsfcs6h2807.apps.googleusercontent.com',
    iosBundleId: 'com.ecommerce01.eCommerce01',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyATy1vmk8ZZUAx-ZAeIc441dtrTRPrltzg',
    appId: '1:356135539437:ios:966e085bdbd8d02320f2e4',
    messagingSenderId: '356135539437',
    projectId: 'ecommerce01-71300',
    storageBucket: 'ecommerce01-71300.appspot.com',
    androidClientId: '356135539437-f4fmjbeekshcm2ngsa7bmo80226p3vis.apps.googleusercontent.com',
    iosClientId: '356135539437-dsrien536odbeklkqtah5nsfcs6h2807.apps.googleusercontent.com',
    iosBundleId: 'com.ecommerce01.eCommerce01',
  );
}
