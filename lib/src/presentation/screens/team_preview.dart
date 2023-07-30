import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_scaffold.dart';
import '../components/skipper_text.dart';
import 'widgets/player_icon.dart';

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
            padding: const EdgeInsets.all(8.0),
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
                Column(
                  children: [
                    SkipperText.textSmall(
                      'Credit Left',
                      color: AppColors.greyish,
                    ),
                    SkipperText.titleBold(
                      '26.5',
                      color: AppColors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 45.0),
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
