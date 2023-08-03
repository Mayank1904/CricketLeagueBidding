import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../resources/constants/colors.dart';
import '../../../utils/extensions/extensions.dart';
import '../../components/skipper_text.dart';
import '../../../domain/models/responses/matches_detail_response.dart' as P;

class Player {
  String? name;
  String? role;
  bool? isCaptain;
  bool? isViceCaptain;
  double? points;
  String? teamName;
  Player(
      {this.name,
      this.role,
      this.isCaptain,
      this.isViceCaptain,
      this.points,
      this.teamName});
}

enum SortOrder {
  ascending,
  descending,
}

class DatatableWidget extends StatefulWidget {
  final Function? onCaptainSelected;
  final Function? onViceCaptainSelected;
  final List<P.Player> players;

  const DatatableWidget({
    Key? key,
    this.onCaptainSelected,
    this.onViceCaptainSelected,
    required this.players,
  }) : super(key: key);

  @override
  State<DatatableWidget> createState() => _DatatableWidgetState();
}

class _DatatableWidgetState extends State<DatatableWidget> {
  late List<Player> players;

  @override
  void initState() {
    players = widget.players.map((e) => _convert(e)).toList();
    super.initState();
  }

  int _sortColumnIndex = 0;
  SortOrder _sortOrder = SortOrder.ascending;

  void _sort<T>(Comparable<T> Function(Player player) getField, int columnIndex,
      bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortOrder = ascending ? SortOrder.ascending : SortOrder.descending;
      players.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return ascending
            ? Comparable.compare(aValue, bValue)
            : Comparable.compare(bValue, aValue);
      });
    });
  }

  Future<void> _selectCaptain(int index) async {
    setState(() {
      for (var i = 0; i < players.length; i++) {
        players[i].isCaptain = (i == index);
        if (players[i].isCaptain!) {
          players[i].isViceCaptain = false;
        }
      }
    });
  }

  Future<void> _selectViceCaptain(int index) async {
    setState(() {
      for (var i = 0; i < players.length; i++) {
        players[i].isViceCaptain = (i == index);
        if (players[i].isViceCaptain!) {
          players[i].isCaptain = false;
        }
      }
    });
  }

  final _convert = (P.Player e) => Player(
        role: e.seasonal_role,
        name: e.name,
        points: e.score,
        isCaptain: false,
        isViceCaptain: false,
        teamName: e.team_key,
      );

  String getRole(String role) {
    if (role == 'bowler') {
      return 'BOWL';
    }
    if (role == 'batsman') {
      return 'BAT';
    }
    if (role == 'allrounder') {
      return 'ALL';
    } else {
      return 'WK';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      sortAscending: _sortOrder == SortOrder.ascending,
      sortColumnIndex: _sortColumnIndex,
      columnSpacing: 5.0,
      isVerticalScrollBarVisible: false,
      isHorizontalScrollBarVisible: false,
      dataRowHeight: 70.0,
      columns: <DataColumn2>[
        DataColumn2(
          fixedWidth: 60,
          label: SkipperText.textSmall(
            'TYPE',
            color: AppColors.brownishGrey,
          ),
        ),
        DataColumn2(
          fixedWidth: 70,
          label: SkipperText.textSmall(
            'POINTS',
            color: AppColors.brownishGrey,
          ),
        ),
        DataColumn2(
          fixedWidth: 60.0,
          label: SkipperText.textSmall(
            '% C BY',
            color: AppColors.brownishGrey,
          ),
        ),
        DataColumn2(
          fixedWidth: 60.0,
          label: SkipperText.textSmall(
            '% VC BY',
            color: AppColors.brownishGrey,
          ),
        ),
      ],
      rows: players
          .mapIndexed<DataRow>(
            (player, i) => DataRow(
              cells: [
                DataCell(
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: 2.0, bottom: 2.0),
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
                                borderRadius: BorderRadius.circular(2),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0x29000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 25.0)
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SkipperText.textExtraSmall(
                                      player.teamName ?? '',
                                      color: AppColors.black,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(2.0),
                                    color: AppColors.black,
                                    child: SkipperText.textExtraSmall(
                                      getRole(player.role ?? ''),
                                      color: AppColors.white,
                                      textAlign: TextAlign.center,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkipperText.textSmallBold(player.name ?? ''),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SkipperText.textSmall("${player.points} pts"),
                        ),
                      ],
                    ),
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18.0)),
                            border: Border.all(
                              color: player.isCaptain == false
                                  ? AppColors.greyCB
                                  : AppColors.blackTwo,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              await _selectCaptain(players.indexOf(player));
                              widget.onCaptainSelected
                                  ?.call(player.isCaptain, players);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: player.isCaptain ?? false
                                      ? AppColors.blackTwo
                                      : AppColors.greyCB,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundColor: player.isCaptain == false
                                    ? AppColors.white
                                    : AppColors.blackTwo,
                                radius: 17.5,
                                child: SkipperText.titleBold(
                                    color: player.isCaptain == false
                                        ? AppColors.blackTwo
                                        : AppColors.white,
                                    player.isCaptain == false ? 'C' : '2X'),
                              ),
                            ),
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
                DataCell(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: player.isViceCaptain ?? false
                                  ? AppColors.blackTwo
                                  : AppColors.greyCB,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              await _selectViceCaptain(players.indexOf(player));
                              widget.onViceCaptainSelected
                                  ?.call(player.isViceCaptain, players);
                            },
                            child: CircleAvatar(
                              backgroundColor: player.isViceCaptain == false
                                  ? AppColors.white
                                  : AppColors.blackTwo,
                              foregroundColor: player.isViceCaptain == false
                                  ? AppColors.blackTwo
                                  : AppColors.white,
                              radius: 18.0,
                              child: SkipperText.titleBold(
                                  player.isViceCaptain == false
                                      ? 'VC'
                                      : '1.5X'),
                            ),
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
              ],
            ),
          )
          .toList(),
    );
  }
}
