import 'package:flutter/material.dart';
import 'package:skipper11/src/ui/screens/create_team_screen.dart';
import 'package:skipper11/src/ui/screens/login_screen.dart';
import 'package:skipper11/src/ui/screens/profile_screen.dart';

import 'ui/screens/register_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const CreateTeamScreen(),
    );
  }
}
