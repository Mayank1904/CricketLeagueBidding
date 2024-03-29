// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    SelectMatchRoute.name: (routeData) {
      final args = routeData.argsAs<SelectMatchRouteArgs>(
          orElse: () => const SelectMatchRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SelectMatchScreen(
          key: args.key,
          card: args.card,
        ),
      );
    },
    UpcomingMatchesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpcomingMatchesScreen(),
      );
    },
  };
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectMatchScreen]
class SelectMatchRoute extends PageRouteInfo<SelectMatchRouteArgs> {
  SelectMatchRoute({
    Key? key,
    Cards? card,
    List<PageRouteInfo>? children,
  }) : super(
          SelectMatchRoute.name,
          args: SelectMatchRouteArgs(
            key: key,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectMatchRoute';

  static const PageInfo<SelectMatchRouteArgs> page =
      PageInfo<SelectMatchRouteArgs>(name);
}

class SelectMatchRouteArgs {
  const SelectMatchRouteArgs({
    this.key,
    this.card,
  });

  final Key? key;

  final Cards? card;

  @override
  String toString() {
    return 'SelectMatchRouteArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [UpcomingMatchesScreen]
class UpcomingMatchesRoute extends PageRouteInfo<void> {
  const UpcomingMatchesRoute({List<PageRouteInfo>? children})
      : super(
          UpcomingMatchesRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpcomingMatchesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
