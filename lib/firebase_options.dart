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
    apiKey: 'AIzaSyBJ_GTJCC81jr9u9GPGWAcyCh81ZCBWWZg',
    appId: '1:397923798650:web:89b0a19be1c979068e35c3',
    messagingSenderId: '397923798650',
    projectId: 'inventory-control-bussropprj',
    authDomain: 'inventory-control-bussropprj.firebaseapp.com',
    storageBucket: 'inventory-control-bussropprj.appspot.com',
    measurementId: 'G-Z2186F2JJX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFBpkAvlVHi8n9nvIMhYQKGa6FLTfad74',
    appId: '1:397923798650:android:0e9344637e06e5108e35c3',
    messagingSenderId: '397923798650',
    projectId: 'inventory-control-bussropprj',
    storageBucket: 'inventory-control-bussropprj.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7BmlnpVLwZws5zSO-TRumKyWmBgLVU7I',
    appId: '1:397923798650:ios:d687d6fbcc1ac8328e35c3',
    messagingSenderId: '397923798650',
    projectId: 'inventory-control-bussropprj',
    storageBucket: 'inventory-control-bussropprj.appspot.com',
    iosClientId: '397923798650-64gc8escl1nhmafoooeiqeckmr5dcopl.apps.googleusercontent.com',
    iosBundleId: 'com.example.goodsmanagementsystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD7BmlnpVLwZws5zSO-TRumKyWmBgLVU7I',
    appId: '1:397923798650:ios:1c0d83c29576b7b08e35c3',
    messagingSenderId: '397923798650',
    projectId: 'inventory-control-bussropprj',
    storageBucket: 'inventory-control-bussropprj.appspot.com',
    iosClientId: '397923798650-fc59m5uvqp2oibbpt8652iefsnebg1ag.apps.googleusercontent.com',
    iosBundleId: 'com.example.goodsmanagementsystem.RunnerTests',
  );
}