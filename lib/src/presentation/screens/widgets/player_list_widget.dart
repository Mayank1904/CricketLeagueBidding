import 'package:flutter/material.dart';
import '../../../domain/models/responses/matches_detail_response.dart';
import '../../components/skipper_text.dart';
import 'select_player_tile.dart';

import '../../../resources/constants/colors.dart';

class PlayerListWidget extends StatelessWidget {
  final Function onTap;
  final List<Player>? items;
  final bool? isSelected;
  final List<bool>? color;
  final String role;
  const PlayerListWidget({
    super.key,
    required this.onTap,
    required this.items,
    required this.role,
    this.isSelected,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    items?.insert(0, const Player());
    items?.insert(1, const Player());
    return ListView.separated(
        separatorBuilder: (context, index) {
          return index != 0
              ? Container(
                  height: 1,
                  color: AppColors.dividerColor, // Custom style
                )
              : Container();
        },
        itemCount: (items!.length),
        itemBuilder: (ctx, index) {
          var item = items?[index];
          if (index == 0) {
            // return the header
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              color: const Color(0xfffff7ea),
              child: SkipperText.textSmall(
                "Pick 1-4 $role",
                color: AppColors.brownishGrey,
                textAlign: TextAlign.center,
              ),
            );
          } else if (index == 1) {
            return Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FlexColumnWidth(6.5),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(1.5),
                3: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                    ),
                    children: [
                      // SELECTED BY
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, top: 12.0, bottom: 12.0),
                        child: SkipperText.textSmall(
                          "SELECTED BY",
                          color: AppColors.brownishGrey,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SkipperText.textSmall(
                        "POINTS",
                        color: AppColors.brownishGrey,
                        textAlign: TextAlign.left,
                      ),

                      SkipperText.textSmall(
                        "CREDITS",
                        color: AppColors.brownishGrey,
                        textAlign: TextAlign.left,
                      ),

                      Container(),
                    ])
              ],
            );
          }
          return SelectPlayerTile(
            player: item,
            isSelected: color?[index],
            position: index + 1,
            onTap: (val, pos) {
              onTap(val, index);
            },
          );
        });
  }
}
