import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../../l10n/support_locale.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/router/app_router.dart';
import '../../resources/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return AnimatedSplashScreen(
      duration: 5000,
      splashIconSize: 160.0,
      splash: 'assets/images/skipper_icon.png',
      nextScreen: MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: L10n.support,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
      ),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.scale,
      backgroundColor: AppColors.backgroundColor,
    );
  }
}
