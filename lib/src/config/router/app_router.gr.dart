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
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
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
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

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
