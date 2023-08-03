import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'team_preview.dart';
import 'widgets/save_team_datatable_widget.dart';

import '../../domain/models/requests/create_team_request.dart';
import '../../domain/models/responses/matches_detail_response.dart' as P;
import '../../resources/constants/colors.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_button.dart';
import '../components/skipper_scaffold.dart';
import '../components/skipper_text.dart';
import '../cubits/saveTeam/save_team_cubit.dart';

class SaveTeamScreen extends StatefulWidget {
  final List<P.Player> batsmen;
  final List<P.Player>? wicketkeeper;
  final List<P.Player> bowlers;
  final List<P.Player> allrounders;
  final String? matchId;
  final double creditLeft;
  final String? start_time;

  const SaveTeamScreen({
    super.key,
    required this.batsmen,
    required this.wicketkeeper,
    required this.bowlers,
    required this.allrounders,
    this.matchId,
    this.start_time,
    required this.creditLeft,
  });

  @override
  State<SaveTeamScreen> createState() => _SaveTeamScreenState();
}

class _SaveTeamScreenState extends State<SaveTeamScreen> {
  bool? isCaptainSelected = false;
  bool? isViceCaptainSelected = false;
  late List<Player> selectedPlayers;
  late List<P.Player> players = widget.wicketkeeper! +
      widget.batsmen +
      widget.allrounders +
      widget.bowlers;

  late SaveTeamCubit saveTeamCubit = BlocProvider.of<SaveTeamCubit>(context);

  @override
  Widget build(BuildContext context) {
    return SkipperScaffold(
      backgroundColor: AppColors.white,
      appBar: SkipperAppbar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: 'Your Fantasy Team',
        subTitle: '1h 51m left',
      ),
      body: BlocConsumer<SaveTeamCubit, SaveTeamState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SkipperText.titleBold(
                      "Choose your Captain and Vice Captain",
                      color: AppColors.backgroundColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                    child: SkipperText.textSmall(
                      "Captain get 2X points, Vice Captain",
                      color: AppColors.backgroundColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          left: 18.0, right: 18.0, top: 50.0),
                      child: DatatableWidget(
                        players: players,
                        onCaptainSelected: (val, selPlayers) {
                          setState(() {
                            isCaptainSelected = val;
                            selectedPlayers = selPlayers;
                          });
                        },
                        onViceCaptainSelected: (val, selPlayers) {
                          setState(() {
                            isViceCaptainSelected = val;
                            selectedPlayers = selPlayers;
                          });
                        },
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: SkipperButton(
                            isDisabled: false,
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TeamPreview(
                                          wicketkeeper: widget.wicketkeeper,
                                          batsmen: widget.batsmen,
                                          allrounders: widget.allrounders,
                                          bowlers: widget.bowlers,
                                          totalPlayers: players.length,
                                          creditLeft: widget.creditLeft,
                                        )),
                              )
                            },
                            buttonColor: AppColors.warmGrey,
                            text: 'Team Preview',
                          ),
                        ),
                        Expanded(
                          child: SkipperButton(
                            isDisabled:
                                !(isCaptainSelected! && isViceCaptainSelected!),
                            onPressed: () =>
                                (isCaptainSelected! && isViceCaptainSelected!)
                                    ? saveTeamCubit.createTeam(
                                        selectedPlayers,
                                        widget.matchId,
                                      )
                                    : null,
                            text: 'Continue',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
