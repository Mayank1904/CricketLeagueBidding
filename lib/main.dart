import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const App());
}
