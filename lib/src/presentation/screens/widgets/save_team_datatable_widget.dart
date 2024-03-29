import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../resources/constants/colors.dart';
import '../../../utils/extensions/extensions.dart';
import '../../components/skipper_text.dart';

class Player {
  String name;
  String role;
  bool isCaptain;
  bool isViceCaptain;

  Player(this.name, this.role, this.isCaptain, this.isViceCaptain);
}

enum SortOrder {
  ascending,
  descending,
}

class DatatableWidget extends StatefulWidget {
  final Function? onCaptainSelected;
  final Function? onViceCaptainSelected;

  const DatatableWidget({
    Key? key,
    this.onCaptainSelected,
    this.onViceCaptainSelected,
  }) : super(key: key);

  @override
  State<DatatableWidget> createState() => _DatatableWidgetState();
}

class _DatatableWidgetState extends State<DatatableWidget> {
  final List<Player> players = [
    Player('Player 1', 'Batsman', false, false),
    Player('Player 2', 'Bowler', false, false),
    Player('Player 3', 'All-Rounder', false, false),
    Player('Player 1', 'Batsman', false, false),
    Player('Player 2', 'Bowler', false, false),
    Player('Player 3', 'All-Rounder', false, false),
    Player('Player 1', 'Batsman', false, false),
    Player('Player 2', 'Bowler', false, false),
    Player('Player 3', 'All-Rounder', false, false),
    Player('Player 3', 'All-Rounder', false, false),
  ];

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
        if (players[i].isCaptain) {
          players[i].isViceCaptain = false;
        }
      }
    });
  }

  Future<void> _selectViceCaptain(int index) async {
    setState(() {
      for (var i = 0; i < players.length; i++) {
        players[i].isViceCaptain = (i == index);
        if (players[i].isViceCaptain) {
          players[i].isCaptain = false;
        }
      }
    });
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
                                      'MUM',
                                      color: AppColors.black,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(2.0),
                                    color: AppColors.black,
                                    child: SkipperText.textExtraSmall(
                                      'WK',
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
                        SkipperText.textSmallBold("Alyssa Healy"),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SkipperText.textSmall("116 pts"),
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
                              widget.onCaptainSelected?.call(player.isCaptain);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: player.isCaptain
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
                                    color: player.isCaptain
                                        ? AppColors.white
                                        : AppColors.blackTwo,
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
                              color: player.isViceCaptain
                                  ? AppColors.blackTwo
                                  : AppColors.greyCB,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              await _selectViceCaptain(players.indexOf(player));
                              widget.onViceCaptainSelected
                                  ?.call(player.isViceCaptain);
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
