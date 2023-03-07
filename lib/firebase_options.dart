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
    apiKey: 'AIzaSyA-YJIJHdeqc-lVXSPWPwKY7W2VMKz-f9Q',
    appId: '1:326279420614:web:ee44c39ac6a32131c595c7',
    messagingSenderId: '326279420614',
    projectId: 'miaged-project-320d0',
    authDomain: 'miaged-project-320d0.firebaseapp.com',
    storageBucket: 'miaged-project-320d0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcKa4P4Nv_oETvjT_WoHtjIO5x7DVoQo0',
    appId: '1:326279420614:android:e5d599a6f13f0e6ac595c7',
    messagingSenderId: '326279420614',
    projectId: 'miaged-project-320d0',
    storageBucket: 'miaged-project-320d0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5ABZob7A0AJNrj0kF-kSscViEXsetdKg',
    appId: '1:326279420614:ios:56808f1c77d54c97c595c7',
    messagingSenderId: '326279420614',
    projectId: 'miaged-project-320d0',
    storageBucket: 'miaged-project-320d0.appspot.com',
    iosClientId: '326279420614-64b4t5fptdkl81nqdkv5j9puelo5hvrd.apps.googleusercontent.com',
    iosBundleId: 'com.example.miaged',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5ABZob7A0AJNrj0kF-kSscViEXsetdKg',
    appId: '1:326279420614:ios:56808f1c77d54c97c595c7',
    messagingSenderId: '326279420614',
    projectId: 'miaged-project-320d0',
    storageBucket: 'miaged-project-320d0.appspot.com',
    iosClientId: '326279420614-64b4t5fptdkl81nqdkv5j9puelo5hvrd.apps.googleusercontent.com',
    iosBundleId: 'com.example.miaged',
  );
}