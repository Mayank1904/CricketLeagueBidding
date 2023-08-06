import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_scaffold.dart';
import 'upcoming_matches_screen.dart';

import '../../resources/constants/colors.dart';
import 'home/sidemenu/side_menu.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SkipperScaffold(
        drawer: const SideMenu(),
        bottomNavigationBar: buildNavigationBar(),
        appBar: SkipperAppbar(
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.wallet_giftcard,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
          ],
        ),
        body: const UpcomingMatchesScreen());
  }

  Widget buildNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.unselectedColor,
      selectedFontSize: 11.0,
      iconSize: 22.0,
      showUnselectedLabels: true,
      backgroundColor: AppColors.black,
      items: const [
        BottomNavigationBarItem(
          backgroundColor: AppColors.black,
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.black,
          icon: Icon(Icons.search),
          label: 'My Matches',
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.black,
          icon: Icon(Icons.money),
          label: 'Rewards',
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.black,
          icon: Icon(Icons.chat_outlined),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.black,
          icon: Icon(Icons.warning_amber),
          label: 'Winners',
        ),
      ],
    );
  }
}
