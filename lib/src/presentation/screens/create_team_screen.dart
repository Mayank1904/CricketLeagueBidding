import 'package:flutter/material.dart';
import '../components/skipper_text.dart';
import 'widgets/player_list_widget.dart';
import 'widgets/select_player_tile.dart';

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
  List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  List<int> selectedItemIdList = [];
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
            SkipperText.title(
              "Max 7 players from a team",
              color: AppColors.white,
            ),
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
                        SkipperText.textSmall(
                          "Players",
                          color: AppColors.white,
                        ),
                        // 0/11
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              style: const TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Graphik",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              text: selectedItemIdList.length.toString()),
                          const TextSpan(
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
                          'assets/images/image_14.png',
                          width: 50,
                          height: 28,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          children: [
                            // MUM
                            SkipperText.textSmall(
                              "MUM",
                              color: AppColors.white,
                            ),
                            // 0
                            const Text("0",
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
                          children: [
                            SkipperText.textSmall(
                              "GUJR",
                              color: AppColors.white,
                            ),
                            // 0
                            const Text("0",
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
                          'assets/images/scroll_group_2.png',
                          width: 50,
                          height: 28,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Credit left
                        SkipperText.textSmall(
                          "Credit Left",
                          color: AppColors.white,
                        ), // 100
                        Text(
                          (100 - selectedItemIdList.length * 9.0).toString(),
                          style: const TextStyle(
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
                currentStep: selectedItemIdList.length,
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
                  PlayerListWidget(
                    items: items,
                    selectedItemIdList: selectedItemIdList,
                    onTap: (value) {
                      setState(() {
                        if (selectedItemIdList.contains(value)) {
                          selectedItemIdList.remove(value);
                        } else {
                          selectedItemIdList.add(value);
                        }
                      });
                    },
                  ),
                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return SelectPlayerTile(
                          onTap: () {},
                        );
                      }),
                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return SelectPlayerTile(
                          onTap: () {},
                        );
                      }),
                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return SelectPlayerTile(
                          onTap: () {},
                        );
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
