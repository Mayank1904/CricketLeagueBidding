import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../l10n/support_locale.dart';
import '../provider/locale_provider.dart';
import 'config/router/app_router.dart';
import 'domain/respositories/skipper_api_repository.dart';
import 'locator.dart';
import 'presentation/cubits/register/register_cubit.dart';
import 'resources/constants/colors.dart';
import 'presentation/screens/intro_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:oktoast/oktoast.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(
            locator<SkipperApiRepository>(),
          )..doRegister(),
        ),
      ],
      child: ChangeNotifierProvider(
          create: (context) => LocaleProvider(),
          builder: (context, child) {
            return Consumer<LocaleProvider>(
                builder: (context, provider, child) {
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
          }),
    );
  }
}
