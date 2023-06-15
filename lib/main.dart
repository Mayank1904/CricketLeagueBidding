import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  // await Firebase.initializeApp();

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(App());
}
