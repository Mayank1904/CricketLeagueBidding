import 'package:flutter/material.dart';

import '../../create_team_screen.dart';
import '../../home_screen.dart';
import '../../select_match_screen.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem(
      {required this.page, required this.title, required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const HomeScreen(),
          icon: const Icon(Icons.home),
          title: const Text("Home"),
        ),
        TabNavigationItem(
          page: const SelectMatchScreen(),
          icon: const Icon(Icons.search),
          title: const Text("Search"),
        ),
        TabNavigationItem(
          page: const CreateTeamScreen(),
          icon: const Icon(Icons.home),
          title: const Text("Home"),
        ),
      ];
}
