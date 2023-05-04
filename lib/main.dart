import 'package:flutter/material.dart';

import 'src/app.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(App());
}
