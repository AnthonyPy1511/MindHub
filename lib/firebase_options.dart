// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCuK6m59Cw8qshE18uO6sbqc9qkSEHCSYs',
    appId: '1:378862575045:web:5ee122afa9c32f8985ffac',
    messagingSenderId: '378862575045',
    projectId: 'indel-flutter',
    authDomain: 'indel-flutter.firebaseapp.com',
    storageBucket: 'indel-flutter.appspot.com',
    measurementId: 'G-DR96MXYCPX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6ZOpsVMlwZGKMAYM2MB3hOhftby1eiQw',
    appId: '1:378862575045:android:c3ad270be058d1bd85ffac',
    messagingSenderId: '378862575045',
    projectId: 'indel-flutter',
    storageBucket: 'indel-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWVTe81k0TOo3EC34a9lZzZ7ufpuwwFQ0',
    appId: '1:378862575045:ios:797d2c62eb84363b85ffac',
    messagingSenderId: '378862575045',
    projectId: 'indel-flutter',
    storageBucket: 'indel-flutter.appspot.com',
    androidClientId: '378862575045-dg6ghomvn8r8lri1gi2jhd40slq5312d.apps.googleusercontent.com',
    iosClientId: '378862575045-jdd3i4tj2267dnster55s5ogc8pp8asu.apps.googleusercontent.com',
    iosBundleId: 'com.example.mindhub',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCuK6m59Cw8qshE18uO6sbqc9qkSEHCSYs',
    appId: '1:378862575045:web:5ee122afa9c32f8985ffac',
    messagingSenderId: '378862575045',
    projectId: 'indel-flutter',
    authDomain: 'indel-flutter.firebaseapp.com',
    storageBucket: 'indel-flutter.appspot.com',
    measurementId: 'G-DR96MXYCPX',
  );
}