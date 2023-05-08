import 'package:auto_route/auto_route.dart';

import '../../presentation/screens/register_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [];
}

final appRouter = AppRouter();
