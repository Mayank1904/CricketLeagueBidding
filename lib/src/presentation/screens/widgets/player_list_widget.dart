import 'package:flutter/material.dart';
import '../../components/skipper_text.dart';
import 'select_player_tile.dart';

import '../../../resources/constants/colors.dart';

class PlayerListWidget extends StatelessWidget {
  final Function onTap;
  final List<int> items;
  final List<int> selectedItemIdList;

  const PlayerListWidget({
    super.key,
    required this.onTap,
    required this.items,
    required this.selectedItemIdList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 9,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            // return the header
            return Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              color: const Color(0xfffff7ea),
              child: SkipperText.textSmall(
                "Pick 1-4 Wicket Keeper",
                color: AppColors.brownishGrey,
                textAlign: TextAlign.center,
              ),
            );
          } else if (index == 1) {
            return Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FlexColumnWidth(4.5),
                1: FlexColumnWidth(1.5),
                2: FlexColumnWidth(1.5),
                3: FlexColumnWidth(2),
              },
              children: [
                TableRow(children: [
                  // SELECTED BY
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
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
          var item = items[index];
          // var isSelected = items.firstWhere((element) => item.id == element.id) != null;
          var isSelected = selectedItemIdList.contains(item);
          return SelectPlayerTile(
            isSelected: isSelected,
            position: index + 1,
            onTap: (val) {
              onTap(val);
            },
          );
        });
  }
}
