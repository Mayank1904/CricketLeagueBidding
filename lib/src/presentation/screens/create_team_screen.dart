import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/responses/matches_detail_response.dart';
import '../components/skipper_button.dart';
import '../components/skipper_text.dart';
import '../cubits/matchesDetail/matches_detail_cubit.dart';
import 'save_team_screen.dart';
import 'team_preview.dart';
import 'widgets/player_list_widget.dart';

import '../../resources/constants/colors.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_scaffold.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CreateTeamScreen extends StatefulWidget {
  final String? team1;
  final String? team2;
  final String? matchId;
  final String? start_time;
  const CreateTeamScreen(
      {super.key, this.team1, this.team2, this.matchId, this.start_time});

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen>
    with TickerProviderStateMixin {
  late MatchesDetailCubit matchesDetailCubit =
      BlocProvider.of<MatchesDetailCubit>(context);
  late final List<bool> _color_batsmen = List.filled(30, false);
  late final List<bool> _color_bowler = List.filled(30, false);
  late final List<bool> colorKeeper = List.filled(30, false);
  late final List<bool> _color_allrounder = List.filled(30, false);

  late final List<Player> _batsmen_selected = List.empty(growable: true);
  late final List<Player> _bowler_selected = List.empty(growable: true);
  late final List<Player> _wk_selected = List.empty(growable: true);
  late final List<Player> _allrounder_selected = List.empty(growable: true);

  late int totalCredit = 0;
  late int keeperCount = 0;
  late int _bowler_count = 0;
  late int _batsmen_count = 0;
  late int _allrounder_count = 0;
  late int _total_players = 0;

  late TabController tabController;

  List<Player> selectedItemIdList = [];

  late List<Player> batsmen = [];
  late List<Player> bowlers = [];
  late List<Player> allrounders = [];
  late List<Player> firstTeamPlayers = [];
  late List<Player> secondTeamPlayers = [];

  void addTeamPlayer(Player player) {
    totalCredit = totalCredit + player.credit_value!;

    if (player.team_key == 'a') {
      firstTeamPlayers.add(player);
    } else {
      secondTeamPlayers.add(player);
    }
  }

  void removeTeamPlayer(Player player) {
    totalCredit = totalCredit - player.credit_value!;

    if (player.team_key == 'a') {
      firstTeamPlayers.remove(player);
    } else {
      secondTeamPlayers.remove(player);
    }
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    matchesDetailCubit.getMatchesDetails();
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
      body: BlocConsumer<MatchesDetailCubit, MatchesDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          return (state is MatchesDetailLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  color: AppColors.backgroundColor,
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
                                        text: _total_players.toString()),
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
                                        state.teams?.a.short_name ?? '',
                                        color: AppColors.white,
                                      ),
                                      // 0
                                      Text(firstTeamPlayers.length.toString(),
                                          style: const TextStyle(
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
                                        state.teams?.b.short_name ?? '',
                                        color: AppColors.white,
                                      ),
                                      // 0
                                      Text(secondTeamPlayers.length.toString(),
                                          style: const TextStyle(
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
                                    (100 - totalCredit).toString(),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12.0),
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
                          currentStep: _total_players,
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
                              child: Text('WK ($keeperCount)'),
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
                        child: Container(
                          color: AppColors.white,
                          child: TabBarView(
                            physics: const BouncingScrollPhysics(
                              parent: PageScrollPhysics(),
                            ),
                            controller: tabController,
                            children: [
                              PlayerListWidget(
                                role: 'Wicket-Keepers',
                                color: colorKeeper,
                                items: state.players
                                    ?.where((element) =>
                                        element.seasonal_role == 'keeper')
                                    .toList(),
                                onTap: (value, index) {
                                  setState(() {
                                    if (keeperCount < 8 &&
                                        colorKeeper[index] == false &&
                                        _total_players < 11) {
                                      colorKeeper[index] = !colorKeeper[index];
                                      keeperCount = keeperCount + 1;
                                      _total_players = _total_players + 1;
                                      _wk_selected.add(value);

                                      addTeamPlayer(value);
                                    } else if (colorKeeper[index] == true) {
                                      colorKeeper[index] = !colorKeeper[index];
                                      keeperCount = keeperCount - 1;
                                      _total_players = _total_players - 1;
                                      _wk_selected
                                          .removeWhere((item) => item == value);
                                      removeTeamPlayer(value);
                                    }
                                  });
                                },
                              ),
                              PlayerListWidget(
                                role: 'Batters',
                                color: _color_batsmen,
                                items: state.players
                                    ?.where((element) =>
                                        element.seasonal_role == 'batsman')
                                    .toList(),
                                onTap: (value, index) {
                                  setState(() {
                                    if (_batsmen_count < 8 &&
                                        _color_batsmen[index] == false &&
                                        _total_players < 11) {
                                      _color_batsmen[index] =
                                          !_color_batsmen[index];
                                      _batsmen_count = _batsmen_count + 1;
                                      _total_players = _total_players + 1;
                                      _batsmen_selected.add(value);

                                      addTeamPlayer(value);
                                    } else if (_color_batsmen[index] == true) {
                                      _color_batsmen[index] =
                                          !_color_batsmen[index];
                                      _batsmen_count = _batsmen_count - 1;
                                      _total_players = _total_players - 1;
                                      _batsmen_selected.removeWhere(
                                          (item) => item == (value));
                                      removeTeamPlayer(value);
                                    }
                                  });
                                },
                              ),
                              PlayerListWidget(
                                role: 'All-Rounders',
                                color: _color_allrounder,
                                items: state.players
                                    ?.where((element) =>
                                        element.seasonal_role == 'allrounder')
                                    .toList(),
                                onTap: (value, index) {
                                  setState(() {
                                    if (_allrounder_count < 8 &&
                                        _color_allrounder[index] == false &&
                                        _total_players < 11) {
                                      _color_allrounder[index] =
                                          !_color_allrounder[index];
                                      _allrounder_count = _allrounder_count + 1;
                                      _total_players = _total_players + 1;
                                      _allrounder_selected.add(value);
                                      addTeamPlayer(value);
                                    } else if (_color_allrounder[index] ==
                                        true) {
                                      _color_allrounder[index] =
                                          !_color_allrounder[index];
                                      _allrounder_count = _allrounder_count - 1;
                                      _total_players = _total_players - 1;
                                      _allrounder_selected.removeWhere(
                                          (item) => item == (value));
                                      removeTeamPlayer(value);
                                    }
                                  });
                                },
                              ),
                              PlayerListWidget(
                                role: 'Bowlers',
                                color: _color_bowler,
                                items: state.players
                                    ?.where((element) =>
                                        element.seasonal_role == 'bowler')
                                    .toList(),
                                onTap: (value, index) {
                                  setState(() {
                                    if (_bowler_count < 8 &&
                                        _color_bowler[index] == false &&
                                        _total_players < 11) {
                                      _color_bowler[index] =
                                          !_color_bowler[index];
                                      _bowler_count = _bowler_count + 1;
                                      _total_players = _total_players + 1;
                                      _bowler_selected.add(value);
                                      addTeamPlayer(value);
                                    } else if (_color_bowler[index] == true) {
                                      _color_bowler[index] =
                                          !_color_bowler[index];
                                      _bowler_count = _bowler_count - 1;
                                      _total_players = _total_players - 1;
                                      _bowler_selected.removeWhere(
                                          (item) => item == (value));
                                      removeTeamPlayer(value);
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 13.0),
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
                                        builder: (context) => TeamPreview(
                                              wicketkeeper: _wk_selected,
                                              batsmen: _batsmen_selected,
                                              allrounders: _allrounder_selected,
                                              bowlers: _bowler_selected,
                                              totalPlayers: _total_players,
                                              creditLeft: (100 - totalCredit)
                                                  .toDouble(),
                                            )),
                                  )
                                },
                                buttonColor: AppColors.warmGrey,
                                text: 'Team Preview',
                              ),
                            ),
                            Expanded(
                              child: SkipperButton(
                                isDisabled: _total_players < 11,
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SaveTeamScreen(
                                              wicketkeeper: _wk_selected,
                                              batsmen: _batsmen_selected,
                                              allrounders: _allrounder_selected,
                                              bowlers: _bowler_selected,
                                              matchId: widget.matchId,
                                              creditLeft: (100 - totalCredit)
                                                  .toDouble(),
                                            )),
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
                );
        },
      ),
    );
  }
}
