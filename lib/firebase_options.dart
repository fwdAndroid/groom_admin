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
    apiKey: 'AIzaSyCu6BdZXY1sQ_EB7kEt-oywitN1dedKwF0',
    appId: '1:927808074565:web:f382cec03a69b7aafd442c',
    messagingSenderId: '927808074565',
    projectId: 'groom-dab96',
    authDomain: 'groom-dab96.firebaseapp.com',
    storageBucket: 'groom-dab96.appspot.com',
    measurementId: 'G-RH8L6RGTSR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHjjhpoTXjiGjtaTLVcDOhh2FEw48wOkA',
    appId: '1:927808074565:android:ac907dfb770d2891fd442c',
    messagingSenderId: '927808074565',
    projectId: 'groom-dab96',
    storageBucket: 'groom-dab96.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgS7234Tc2yq0Eg1JRNCmv7hJYbdiNNHE',
    appId: '1:927808074565:ios:3d3a1ad4c32dbff7fd442c',
    messagingSenderId: '927808074565',
    projectId: 'groom-dab96',
    storageBucket: 'groom-dab96.appspot.com',
    androidClientId: '927808074565-0bs3vqvor9a3mbs671ssnks9vkiv1m4b.apps.googleusercontent.com',
    iosClientId: '927808074565-2i1gsud243v94rg8q9b7mq5ghrmdiedj.apps.googleusercontent.com',
    iosBundleId: 'com.example.groomAdmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgS7234Tc2yq0Eg1JRNCmv7hJYbdiNNHE',
    appId: '1:927808074565:ios:3d3a1ad4c32dbff7fd442c',
    messagingSenderId: '927808074565',
    projectId: 'groom-dab96',
    storageBucket: 'groom-dab96.appspot.com',
    androidClientId: '927808074565-0bs3vqvor9a3mbs671ssnks9vkiv1m4b.apps.googleusercontent.com',
    iosClientId: '927808074565-2i1gsud243v94rg8q9b7mq5ghrmdiedj.apps.googleusercontent.com',
    iosBundleId: 'com.example.groomAdmin',
  );
}
