import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final String? match_id;
  final String? team1;
  final String? team2;
  final String? start_time;

  const SaveTeamScreen({
    super.key,
    required this.batsmen,
    required this.wicketkeeper,
    required this.bowlers,
    required this.allrounders,
    this.match_id,
    this.team1,
    this.team2,
    this.start_time,
  });

  @override
  State<SaveTeamScreen> createState() => _SaveTeamScreenState();
}

class _SaveTeamScreenState extends State<SaveTeamScreen> {
  bool? isCaptainSelected = false;
  bool? isViceCaptainSelected = false;
  late CreateTeamRequest createTeamRequest;

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
                        onCaptainSelected: (val) {
                          setState(() {
                            isCaptainSelected = val;
                          });
                        },
                        onViceCaptainSelected: (val) {
                          setState(() {
                            isViceCaptainSelected = val;
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
                            onPressed: () => {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const TeamPreview(
                              //             wicketkeeper: ['D. Conway', 'W Saha'],
                              //             batsmen: [
                              //               'R Gaikwad',
                              //               'S Gill',
                              //               'H Pandya',
                              //               'M Ali',
                              //               'M Pathirana',
                              //               'Mayank',
                              //               'Usjsk'
                              //             ],
                              //             allrounders: [
                              //               'R Jadeja',
                              //             ],
                              //             bowlers: [
                              //               'M Shami',
                              //               'Rashid K',
                              //             ],
                              //           )),
                              // )
                            },
                            buttonColor: AppColors.warmGrey,
                            text: 'Team Preview',
                          ),
                        ),
                        Expanded(
                          child: SkipperButton(
                            onPressed: () => (isCaptainSelected! &&
                                    isViceCaptainSelected!)
                                ? saveTeamCubit.createTeam(createTeamRequest)
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
