import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/constants/colors.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_scaffold.dart';
import '../components/skipper_text.dart';
import '../cubits/register/register_cubit.dart';

class SaveTeamScreen extends StatefulWidget {
  final List<String>? batsmen;
  final List<String>? wicketkeeper;
  final List<String>? bowlers;
  final List<String>? allrounders;
  final String? match_id;
  final String? team1;
  final String? team2;
  final String? start_time;
  const SaveTeamScreen(
      {super.key,
      this.batsmen,
      this.wicketkeeper,
      this.bowlers,
      this.allrounders,
      this.match_id,
      this.team1,
      this.team2,
      this.start_time});

  @override
  State<SaveTeamScreen> createState() => _SaveTeamScreenState();
}

class _SaveTeamScreenState extends State<SaveTeamScreen> {
  final tempList = [
    1,
    2,
    3,
    4,
    4,
    5,
    6,
    7,
    8,
    9,
  ];
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
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SkipperText.titleBold(
                    "Choose your Captain and Vice Captain",
                    color: AppColors.backgroundColor,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SkipperText.textSmall(
                      "Captain get 2X points, Vice Captain",
                      color: AppColors.backgroundColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataTable(
                      columnSpacing: 20,
                      horizontalMargin: 12,
                      dataRowHeight: 70.0,
                      columns: <DataColumn>[
                        DataColumn(
                          label: SkipperText.textSmall(
                            'TYPE',
                            color: AppColors.brownishGrey,
                          ),
                        ),
                        DataColumn(
                          label: SkipperText.textSmall(
                            'POINTS',
                            color: AppColors.brownishGrey,
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: SkipperText.textSmall(
                              '% C BY',
                              color: AppColors.brownishGrey,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: SkipperText.textSmall(
                              '% VC BY',
                              color: AppColors.brownishGrey,
                            ),
                          ),
                        ),
                      ],
                      rows: tempList
                          .map<DataRow>(
                            (e) => DataRow(
                              cells: [
                                DataCell(
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 2.0, bottom: 2.0),
                                            child: Image.asset(
                                              'assets/images/player.jpg',
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 13,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Color(0x29000000),
                                                      offset: Offset(0, 3),
                                                      blurRadius: 25.0)
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: SkipperText
                                                        .textExtraSmall(
                                                      'MUM',
                                                      color: AppColors.black,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    color: AppColors.black,
                                                    child: SkipperText
                                                        .textExtraSmall(
                                                      'WK',
                                                      color: AppColors.white,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SkipperText.textSmallBold(
                                              "Alyssa Healy"),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: SkipperText.textSmall(
                                                "116 pts"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(18.0)),
                                              border: Border.all(
                                                color: AppColors.greyCB,
                                              ),
                                            ),
                                            child: const CircleAvatar(
                                              backgroundColor: AppColors.white,
                                              foregroundColor: AppColors.black,
                                              radius: 18.0,
                                              child: Text('C'),
                                            ),
                                          ),
                                          const Spacer(),
                                          SkipperText.textExtraSmall(
                                            "56%",
                                            color: AppColors.brownishGrey,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(18.0)),
                                              border: Border.all(
                                                color: AppColors.greyCB,
                                              ),
                                            ),
                                            child: const CircleAvatar(
                                              backgroundColor: AppColors.white,
                                              foregroundColor: AppColors.black,
                                              radius: 18.0,
                                              child: Text('VC'),
                                            ),
                                          ),
                                          const Spacer(),
                                          SkipperText.textExtraSmall(
                                            "56%",
                                            color: AppColors.brownishGrey,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
