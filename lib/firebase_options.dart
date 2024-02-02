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
    apiKey: 'AIzaSyBhKmiIrpUQ88oouF8tpR3_sA0zV-MtvCA',
    appId: '1:653406137163:web:8af5283bb744edd7ae96ce',
    messagingSenderId: '653406137163',
    projectId: 'closet-assignment-eeedb',
    authDomain: 'closet-assignment-eeedb.firebaseapp.com',
    storageBucket: 'closet-assignment-eeedb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFCCwADD_062x0h99VUSa-dychR5Xwp9k',
    appId: '1:653406137163:android:a7de669be81e66d4ae96ce',
    messagingSenderId: '653406137163',
    projectId: 'closet-assignment-eeedb',
    storageBucket: 'closet-assignment-eeedb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBN-REyjSCC4IPqNENL8opP6lFr7bP3VOU',
    appId: '1:653406137163:ios:09a70f5b32fab287ae96ce',
    messagingSenderId: '653406137163',
    projectId: 'closet-assignment-eeedb',
    storageBucket: 'closet-assignment-eeedb.appspot.com',
    iosBundleId: 'com.example.closetAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBN-REyjSCC4IPqNENL8opP6lFr7bP3VOU',
    appId: '1:653406137163:ios:f6c20ca48dea11fcae96ce',
    messagingSenderId: '653406137163',
    projectId: 'closet-assignment-eeedb',
    storageBucket: 'closet-assignment-eeedb.appspot.com',
    iosBundleId: 'com.example.closetAssignment.RunnerTests',
  );
}