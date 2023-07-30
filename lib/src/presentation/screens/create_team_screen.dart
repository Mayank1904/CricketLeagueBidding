import 'package:flutter/material.dart';
import '../components/skipper_button.dart';
import '../components/skipper_text.dart';
import 'save_team_screen.dart';
import 'team_preview.dart';
import 'widgets/player_list_widget.dart';
import 'widgets/select_player_tile.dart';

import '../../resources/constants/colors.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_scaffold.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CreateTeamScreen extends StatefulWidget {
  final String? team1;
  final String? team2;
  final String? match_id;
  final String? start_time;
  const CreateTeamScreen(
      {super.key, this.team1, this.team2, this.match_id, this.start_time});

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen>
    with TickerProviderStateMixin {
  late final List<bool> _color_batsmen = List.filled(30, false);
  late final List<bool> _color_bowler = List.filled(30, false);
  late final List<bool> _color_wk = List.filled(30, false);
  late final List<bool> _color_allrounder = List.filled(30, false);

  late final List<String> _batsmen_selected =
      List.filled(0, '', growable: true);
  late final List<String> _bowler_selected = List.filled(0, '', growable: true);
  late final List<String> _wk_selected = List.filled(0, '', growable: true);
  late final List<String> _allrounder_selected =
      List.filled(0, '', growable: true);

  late int _wk_count = 0;
  late int _bowler_count = 0;
  late int _batsmen_count = 0;
  late int _allrounder_count = 0;
  late int _total_players = 0;

  late TabController tabController;

  List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  List<int> selectedItemIdList = [];

  late List<String> batsmen = [];
  late List<String> bowlers = [];
  late List<String> allrounders = [];
  late List<String> wicketkeepers = [];

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              height: 40.0,
              width: double.maxFinite,
              color: AppColors.darkGreen,
              child: TabBar(
                isScrollable: true,
                indicatorColor: AppColors.yellow,
                controller: tabController,
                labelColor: AppColors.white,
                unselectedLabelColor: AppColors.warmGrey,
                tabs: <Widget>[
                  Tab(
                    child: Text('WK ($_wk_count)'),
                  ),
                  Tab(
                    child: Text('BAT ($_batsmen_count)'),
                  ),
                  Tab(
                    child: Text('AR ($_allrounder_count)'),
                  ),
                  Tab(
                    child: Text('BOWL ($_bowler_count)'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(
                  parent: PageScrollPhysics(),
                ),
                controller: tabController,
                children: [
                  PlayerListWidget(
                    items: items,
                    selectedItemIdList: selectedItemIdList,
                    onTap: (value, index) {
                      setState(() {
                        if (selectedItemIdList.contains(value)) {
                          selectedItemIdList.remove(value);
                        } else {
                          selectedItemIdList.add(value);
                        }
                      });
                      setState(() {
                        if (_wk_count < 2 &&
                            _color_wk[index] == false &&
                            _total_players < 11) {
                          _color_wk[index] = !_color_wk[index];
                          _wk_count = _wk_count + 1;
                          _total_players = _total_players + 1;
                          _wk_selected.add(wicketkeepers[index]);
                        } else if (_color_wk[index] == true) {
                          _color_wk[index] = !_color_wk[index];
                          _wk_count = _wk_count - 1;
                          _total_players = _total_players - 1;
                          _wk_selected.removeWhere(
                              (item) => item == wicketkeepers[index]);
                        }
                      });
                    },
                  ),
                  PlayerListWidget(
                    items: items,
                    selectedItemIdList: selectedItemIdList,
                    onTap: (value, index) {
                      setState(() {
                        if (selectedItemIdList.contains(value)) {
                          selectedItemIdList.remove(value);
                        } else {
                          selectedItemIdList.add(value);
                        }
                      });
                      setState(() {
                        if (_batsmen_count < 5 &&
                            _color_batsmen[index] == false &&
                            _total_players < 11) {
                          _color_batsmen[index] = !_color_batsmen[index];
                          _batsmen_count = _batsmen_count + 1;
                          _total_players = _total_players + 1;
                          _batsmen_selected.add(batsmen[index]);
                        } else if (_color_batsmen[index] == true) {
                          _color_batsmen[index] = !_color_batsmen[index];
                          _batsmen_count = _batsmen_count - 1;
                          _total_players = _total_players - 1;
                          _batsmen_selected
                              .removeWhere((item) => item == (batsmen[index]));
                        }
                      });
                    },
                  ),
                  PlayerListWidget(
                    items: items,
                    selectedItemIdList: selectedItemIdList,
                    onTap: (value, index) {
                      setState(() {
                        if (selectedItemIdList.contains(value)) {
                          selectedItemIdList.remove(value);
                        } else {
                          selectedItemIdList.add(value);
                        }
                      });
                      setState(() {
                        if (_allrounder_count < 3 &&
                            _color_allrounder[index] == false &&
                            _total_players < 11) {
                          _color_allrounder[index] = !_color_allrounder[index];
                          _allrounder_count = _allrounder_count + 1;
                          _total_players = _total_players + 1;
                          _allrounder_selected.add(allrounders[index]);
                        } else if (_color_allrounder[index] == true) {
                          _color_allrounder[index] = !_color_allrounder[index];
                          _allrounder_count = _allrounder_count - 1;
                          _total_players = _total_players - 1;
                          _allrounder_selected.removeWhere(
                              (item) => item == (allrounders[index]));
                        }
                      });
                    },
                  ),
                  PlayerListWidget(
                    items: items,
                    selectedItemIdList: selectedItemIdList,
                    onTap: (value, index) {
                      setState(() {
                        if (selectedItemIdList.contains(value)) {
                          selectedItemIdList.remove(value);
                        } else {
                          selectedItemIdList.add(value);
                        }
                      });
                      setState(() {
                        if (_bowler_count < 5 &&
                            _color_bowler[index] == false &&
                            _total_players < 11) {
                          _color_bowler[index] = !_color_bowler[index];
                          _bowler_count = _bowler_count + 1;
                          _total_players = _total_players + 1;
                          _bowler_selected.add(bowlers[index]);
                        } else if (_color_bowler[index] == true) {
                          _color_bowler[index] = !_color_bowler[index];
                          _bowler_count = _bowler_count - 1;
                          _total_players = _total_players - 1;
                          _bowler_selected
                              .removeWhere((item) => item == (bowlers[index]));
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
              width: double.infinity,
              color: AppColors.greyED,
              height: 70.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: SkipperButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TeamPreview(
                                    wicketkeeper: ['D. Conway', 'W Saha'],
                                    batsmen: [
                                      'R Gaikwad',
                                      'S Gill',
                                      'H Pandya',
                                      'M Ali',
                                      'M Pathirana',
                                      'Mayank',
                                      'Usjsk'
                                    ],
                                    allrounders: [
                                      'R Jadeja',
                                    ],
                                    bowlers: [
                                      'M Shami',
                                      'Rashid K',
                                    ],
                                  )),
                        )
                      },
                      buttonColor: AppColors.warmGrey,
                      text: 'Team Preview',
                    ),
                  ),
                  Expanded(
                    child: SkipperButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SaveTeamScreen()),
                        )
                      },
                      text: 'Continue',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
