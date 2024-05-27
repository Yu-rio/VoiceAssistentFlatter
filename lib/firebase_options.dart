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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
    apiKey: 'AIzaSyCgvOtYCEooV7_ixIwQbQjp8CmVIlljXro',
    appId: '1:538349270145:android:755eeed195d56ccba84980',
    messagingSenderId: '538349270145',
    projectId: 'assistant-29a07',
    storageBucket: 'assistant-29a07.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJ_ywG1rAq3PjsFPYRg_sjGkflYFxzB_0',
    appId: '1:538349270145:ios:0925a376549ab7c9a84980',
    messagingSenderId: '538349270145',
    projectId: 'assistant-29a07',
    storageBucket: 'assistant-29a07.appspot.com',
    iosBundleId: 'com.example.voiceAssistent',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJ_ywG1rAq3PjsFPYRg_sjGkflYFxzB_0',
    appId: '1:538349270145:ios:0925a376549ab7c9a84980',
    messagingSenderId: '538349270145',
    projectId: 'assistant-29a07',
    storageBucket: 'assistant-29a07.appspot.com',
    iosBundleId: 'com.example.voiceAssistent',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAVloZJrJk-TC1luIjXmBeITGQz14kjJaM',
    appId: '1:538349270145:web:c03327024c9691d5a84980',
    messagingSenderId: '538349270145',
    projectId: 'assistant-29a07',
    authDomain: 'assistant-29a07.firebaseapp.com',
    storageBucket: 'assistant-29a07.appspot.com',
    measurementId: 'G-J9HFF3L292',
  );
}