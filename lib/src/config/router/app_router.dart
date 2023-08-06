import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/models/responses/card.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/intro_screen.dart';
import '../../presentation/screens/login_screen.dart';
import '../../presentation/screens/profile_screen.dart';
import '../../presentation/screens/select_match_screen.dart';
import '../../presentation/screens/upcoming_matches_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: IntroRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: UpcomingMatchesRoute.page),
        AutoRoute(page: SelectMatchRoute.page),
      ];
}

final appRouter = AppRouter();
