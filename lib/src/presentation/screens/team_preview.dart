import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_scaffold.dart';
import '../components/skipper_text.dart';

class TeamPreview extends StatelessWidget {
  final List<String>? batsmen;
  final List<String>? bowlers;
  final List<String>? wicketkeeper;
  final List<String>? allrounders;

  const TeamPreview(
      {super.key,
      this.batsmen,
      this.bowlers,
      this.allrounders,
      this.wicketkeeper});

  @override
  Widget build(BuildContext context) {
    return SkipperScaffold(
      appBar: SkipperAppbar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: 'Team Preview',
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.backgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SkipperText.textSmall(
                      'Players',
                      color: AppColors.greyish,
                    ),
                    SkipperText.titleBold(
                      '11/11',
                      color: AppColors.white,
                    )
                  ],
                ),
                Container(
                  width: 56,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(44),
                    ),
                  ),
                  child: SkipperText.bodyBold(
                    'IND 6',
                    color: AppColors.white,
                  ),
                ),
                // Rectangle 2693
                Container(
                    width: 59,
                    height: 12,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.transparent, width: 0.0),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(44),
                        ),
                        color: const Color(0xff3c006d))),
                Column(
                  children: [
                    SkipperText.textSmall(
                      'Credit Left',
                      color: AppColors.greyish,
                    ),
                    SkipperText.titleBold(
                      '26.5',
                      color: AppColors.white,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 45.0),
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/ground.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SkipperText.titleBold(
                    'WICKET-KEEPERS',
                    color: AppColors.veryLightGreen,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      for (int i = 0; i < wicketkeeper!.length; i++)
                        PlayerIcon(
                          player: wicketkeeper!,
                          i: i,
                          playerType: 'wk',
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SkipperText.titleBold(
                    'BATTERS',
                    color: AppColors.veryLightGreen,
                  ),
                  Wrap(alignment: WrapAlignment.center, children: [
                    for (int i = 0; i < batsmen!.length; i++)
                      PlayerIcon(
                        player: batsmen!,
                        i: i,
                        playerType: 'bat',
                      )
                  ]),
                  const SizedBox(height: 8),
                  SkipperText.titleBold(
                    'ALL-ROUNDER',
                    color: AppColors.veryLightGreen,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      for (int i = 0; i < allrounders!.length; i++)
                        PlayerIcon(
                          player: allrounders!,
                          i: i,
                          playerType: 'bat_ball',
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SkipperText.titleBold(
                    'BOWLERS',
                    color: AppColors.veryLightGreen,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      for (int i = 0; i < bowlers!.length; i++)
                        PlayerIcon(
                          player: bowlers!,
                          i: i,
                          playerType: 'ball',
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerIcon extends StatelessWidget {
  const PlayerIcon({
    Key? key,
    required this.player,
    required this.i,
    required this.playerType,
  }) : super(key: key);

  final List<String> player;
  final int i;
  final String playerType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/$playerType.jpg'),
            backgroundColor: Colors.white,
            radius: 27,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          child: SkipperText.textSmall(
            player[i],
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
