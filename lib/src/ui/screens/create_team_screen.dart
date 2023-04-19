import 'package:flutter/material.dart';
import 'package:skipper11/src/ui/screens/widgets/select_player_tile.dart';

import '../../resources/constants/colors.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_scaffold.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({super.key});

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return SkipperScaffold(
      appBar: SkipperAppbar(
        title: 'Create Team',
        actions: <Widget>[
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
      body: SizedBox(
        height: double.maxFinite,
        child: Column(
          children: [
            // Max 7 players from a team
            const Text("Max 7 players from a team",
                style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Graphik",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.center),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 20.0,
              ),
              child: SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Players
                        const Text("Players",
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Graphik",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            textAlign: TextAlign.left),
                        // 0/11
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Graphik",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              text: "0"),
                          TextSpan(
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Graphik",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              text: "/11")
                        ]))
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/player.jpg',
                          width: 50,
                          height: 28,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          children: const [
                            // MUM
                            Text("MUM",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Graphik",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                textAlign: TextAlign.center),
                            // 0
                            Text("0",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Graphik",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13.0),
                                textAlign: TextAlign.center),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: const [
                            // MUM
                            Text("GUJR",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Graphik",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                textAlign: TextAlign.center),
                            // 0
                            Text("0",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Graphik",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13.0),
                                textAlign: TextAlign.center),
                          ],
                        ),
                        Image.asset(
                          'assets/images/player.jpg',
                          width: 50,
                          height: 28,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        // Credit left
                        Text(
                          "Credit left",
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Graphik",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left,
                        ), // 100
                        Text(
                          "100",
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Graphik",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: StepProgressIndicator(
                customStep: (index, color, _) => Container(
                  transform: Matrix4.skewX(-.3),
                  alignment: Alignment.center,
                  color: color,
                  child: Text((index + 1).toString(),
                      style: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Graphik",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0),
                      textAlign: TextAlign.left),
                ),
                totalSteps: 10,
                size: 18,
                selectedColor: AppColors.yellow,
                unselectedColor: AppColors.white,
                currentStep: 5,
              ),
            ),
            Container(
              width: double.maxFinite,
              color: AppColors.darkGreen,
              child: TabBar(
                isScrollable: true,
                indicatorColor: AppColors.yellow,
                controller: tabController,
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.warmGrey,
                tabs: const <Widget>[
                  Tab(
                    child: Text('WK (0)'),
                  ),
                  Tab(
                    child: Text('BAT (0)'),
                  ),
                  Tab(
                    child: Text('AR (0)'),
                  ),
                  Tab(
                    child: Text('BOWL (0)'),
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.white,
              width: double.maxFinite,
              height: 480,
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                      itemCount: 9,
                      itemBuilder: (ctx, index) {
                        if (index == 0) {
                          // return the header
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            color: const Color(0xfffff7ea),
                            child: const Text(
                              "Pick 1-4 Wicket Keeper",
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Graphik",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.center,
                            ),
                          );
                        } else if (index == 1) {
                          return Table(
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            columnWidths: const {
                              0: FlexColumnWidth(4.5),
                              1: FlexColumnWidth(1.5),
                              2: FlexColumnWidth(1.5),
                              3: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(children: [
                                // SELECTED BY
                                const Padding(
                                  padding: EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    "SELECTED BY",
                                    style: TextStyle(
                                        color: AppColors.brownishGrey,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Graphik",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                const Text(
                                  "POINTS",
                                  style: TextStyle(
                                      color: AppColors.brownishGrey,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Graphik",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.left,
                                ),
                                const Text(
                                  "CREDITS",
                                  style: TextStyle(
                                      color: AppColors.brownishGrey,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Graphik",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.left,
                                ),
                                Container(),
                              ])
                            ],
                          );
                        }
                        return const SelectPlayerTile();
                      }),
                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return const SelectPlayerTile();
                      }),
                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return const SelectPlayerTile();
                      }),
                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return const SelectPlayerTile();
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
