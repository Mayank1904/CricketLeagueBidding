import 'package:flutter/material.dart';
import 'package:skipper11/src/resources/constants/colors.dart';
import 'package:skipper11/src/ui/screens/create_team_screen.dart';
import 'package:skipper11/src/ui/screens/home_screen.dart';
import 'package:skipper11/src/ui/screens/intro_screen.dart';
import 'package:skipper11/src/ui/screens/login_screen.dart';
import 'package:skipper11/src/ui/screens/profile_screen.dart';
import 'package:skipper11/src/ui/screens/widgets/select_match_screen.dart';

import 'ui/screens/register_screen.dart';

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
