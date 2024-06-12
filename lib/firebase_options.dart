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
        return macos;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXDA8gy7PlaPAB8LZ2veOoR1i2IKUNj9Q',
    appId: '1:473373018108:android:a7b92a1e2253b63da29479',
    messagingSenderId: '473373018108',
    projectId: 'nusantara-news-app',
    storageBucket: 'nusantara-news-app.appspot.com',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDwFNtfwPmW3EQ4-aQX0OPyaD38t-i-1WA',
    appId: '1:473373018108:web:d31beeeac3abb0eca29479',
    messagingSenderId: '473373018108',
    projectId: 'nusantara-news-app',
    authDomain: 'nusantara-news-app.firebaseapp.com',
    storageBucket: 'nusantara-news-app.appspot.com',
    measurementId: 'G-KRRRVQ7ZND',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBV5lewiHhgGPjJjoIzIRitRkSXpNzvyGk',
    appId: '1:473373018108:ios:e381bec57dc2599ba29479',
    messagingSenderId: '473373018108',
    projectId: 'nusantara-news-app',
    storageBucket: 'nusantara-news-app.appspot.com',
    androidClientId: '473373018108-m296m276vcb9t36fhbdg9b4nf9s5ngo9.apps.googleusercontent.com',
    iosClientId: '473373018108-q6km93fd313t2qqrq9c095a7c0jqo8h3.apps.googleusercontent.com',
    iosBundleId: 'com.example.nusantaraNewsApp',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBV5lewiHhgGPjJjoIzIRitRkSXpNzvyGk',
    appId: '1:473373018108:ios:e381bec57dc2599ba29479',
    messagingSenderId: '473373018108',
    projectId: 'nusantara-news-app',
    storageBucket: 'nusantara-news-app.appspot.com',
    androidClientId: '473373018108-m296m276vcb9t36fhbdg9b4nf9s5ngo9.apps.googleusercontent.com',
    iosClientId: '473373018108-q6km93fd313t2qqrq9c095a7c0jqo8h3.apps.googleusercontent.com',
    iosBundleId: 'com.example.nusantaraNewsApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDwFNtfwPmW3EQ4-aQX0OPyaD38t-i-1WA',
    appId: '1:473373018108:web:c9315b3aa6c240f8a29479',
    messagingSenderId: '473373018108',
    projectId: 'nusantara-news-app',
    authDomain: 'nusantara-news-app.firebaseapp.com',
    storageBucket: 'nusantara-news-app.appspot.com',
    measurementId: 'G-0EY78REKK8',
  );

}