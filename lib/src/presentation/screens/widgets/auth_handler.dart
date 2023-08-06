import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../../utils/auth_service.dart';
import '../home_screen.dart';
import '../intro_screen.dart';

@RoutePage()
class AuthHandler extends StatelessWidget {
  const AuthHandler({super.key});
  @override
  Widget build(BuildContext context) {
    final authService = locator<AuthService>();

    return FutureBuilder(
      initialData: false,
      future: authService.isTokenValid(),
      builder: (_, AsyncSnapshot<bool> snapshot) =>
          (snapshot.hasData && snapshot.data != null)
              ? const HomeScreen()
              : const IntroScreen(),
    );
  }
}
