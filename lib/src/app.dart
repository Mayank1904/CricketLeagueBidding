import 'package:flutter/material.dart';
import 'config/router/app_router.dart';
import 'resources/constants/colors.dart';
import 'presentation/screens/intro_screen.dart';
import 'package:oktoast/oktoast.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: AppColors.backgroundColor, fontFamily: 'Graphik'),
      home: const IntroScreen(),
    );

    OKToast(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
