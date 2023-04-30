import 'package:flutter/material.dart';
import '../l10n/support_locale.dart';
import '../provider/locale_provider.dart';
import 'config/router/app_router.dart';
import 'resources/constants/colors.dart';
import 'presentation/screens/intro_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:oktoast/oktoast.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          return Consumer<LocaleProvider>(builder: (context, provider, child) {
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              locale: provider.locale,
              supportedLocales: L10n.support,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primaryColor: AppColors.backgroundColor,
                  fontFamily: 'Graphik'),
              home: const IntroScreen(),
            );
          });
        });
  }
}
