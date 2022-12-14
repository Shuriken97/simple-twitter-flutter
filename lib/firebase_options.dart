// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        return android;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAyvcUwfJrHx7XucQyB5PxjbdL-q7LvswI',
    appId: '1:513057816224:web:215fd6d0b91ecf57b893c5',
    messagingSenderId: '513057816224',
    projectId: 'simple-twitter-5e0ea',
    authDomain: 'simple-twitter-5e0ea.firebaseapp.com',
    storageBucket: 'simple-twitter-5e0ea.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzoXht5eeAjJC96W6y4b3VhUEfX1oQhjE',
    appId: '1:513057816224:android:c53fc17fa2eaaf2eb893c5',
    messagingSenderId: '513057816224',
    projectId: 'simple-twitter-5e0ea',
    storageBucket: 'simple-twitter-5e0ea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKTVbFfPSq69UMcb4r9WTHt9xUEtEjmWE',
    appId: '1:513057816224:ios:8c1e25f36c4c3e88b893c5',
    messagingSenderId: '513057816224',
    projectId: 'simple-twitter-5e0ea',
    storageBucket: 'simple-twitter-5e0ea.appspot.com',
    iosClientId: '513057816224-57pvkcjvq7u381mjm1auus2gh8q3kn71.apps.googleusercontent.com',
    iosBundleId: 'com.example.simpleTwitter',
  );
}
