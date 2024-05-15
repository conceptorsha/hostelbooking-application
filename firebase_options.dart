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
    apiKey: 'AIzaSyCQo1RgJaA7aNjQDbIVI3J_nRq7fxgVacQ',
    appId: '1:316131909023:web:874df272da903aceb731aa',
    messagingSenderId: '316131909023',
    projectId: 'hostelbooking-9f08d',
    authDomain: 'hostelbooking-9f08d.firebaseapp.com',
    storageBucket: 'hostelbooking-9f08d.appspot.com',
    measurementId: 'G-HRKTELVWK8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdUPE7jL65I9FToMXs8yg8L4fbenrFEaY',
    appId: '1:316131909023:android:13207c61e0456da4b731aa',
    messagingSenderId: '316131909023',
    projectId: 'hostelbooking-9f08d',
    storageBucket: 'hostelbooking-9f08d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtC4-gDKMLdQeBnKgr8SgSllV6xorLqTA',
    appId: '1:316131909023:ios:8f051e52aad960c4b731aa',
    messagingSenderId: '316131909023',
    projectId: 'hostelbooking-9f08d',
    storageBucket: 'hostelbooking-9f08d.appspot.com',
    iosBundleId: 'com.example.hostelOne',
  );
}
