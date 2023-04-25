import 'package:flutter/material.dart';
import 'resources/constants/colors.dart';
import 'presentation/screens/intro_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: AppColors.backgroundColor, fontFamily: 'Graphik'),
      home: const IntroScreen(),
    );
  }
}
