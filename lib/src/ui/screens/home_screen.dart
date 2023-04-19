import 'package:flutter/material.dart';
import 'package:skipper11/src/ui/components/skipper_app_bar.dart';
import 'package:skipper11/src/ui/components/skipper_scaffold.dart';
import 'package:skipper11/src/ui/screens/widgets/upcoming_match_tile.dart';

import '../../resources/constants/colors.dart';
import 'home/sidemenu/side_menu.dart';
import 'widgets/page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SkipperScaffold(
      drawer: SideMenu(),
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
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.0,
                width: double.maxFinite,
                child: PageView.builder(
                  padEnds: false,
                  controller: _controller,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int itemIndex) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Image.asset(
                        'assets/images/banner.jpg',
                      ),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                ),
                child: PageIndicator(
                  itemCount: 4,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 25.0,
                  left: 20.0,
                ),
                child: Text("Upcoming Matches",
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Graphik",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.left),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (ctx, index) {
                    return const Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                      child: UpcomingMatchTile(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
