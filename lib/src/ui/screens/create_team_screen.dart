import 'package:flutter/material.dart';

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
      body: Column(
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
                      'images/man_2.png',
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
                      'images/man_2.png',
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
            color: AppColors.darkGreen,
            child: TabBar(
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
            height: 300,
            child: TabBarView(
              controller: tabController,
              children: const [
                Text('WK (0)', style: TextStyle(color: AppColors.black)),
                Text('BAT (0)', style: TextStyle(color: AppColors.black)),
                Text('AR (0)', style: TextStyle(color: AppColors.black)),
                Text('BOWL (0)', style: TextStyle(color: AppColors.white))
              ],
            ),
          )
        ],
      ),
    );
  }
}
