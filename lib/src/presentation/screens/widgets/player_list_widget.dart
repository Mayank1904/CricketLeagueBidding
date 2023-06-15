import 'package:flutter/material.dart';
import 'select_player_tile.dart';

import '../../../resources/constants/colors.dart';

class PlayerListWidget extends StatelessWidget {
  final Function onTap;
  const PlayerListWidget({
    super.key,
    required this.onTap,
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
              child: const Text(
                "Pick 1-4 Wicket Keeper",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Graphik",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text(
                      "SELECTED BY",
                      style: TextStyle(
                          color: AppColors.brownishGrey,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Graphik",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Text(
                    "POINTS",
                    style: TextStyle(
                        color: AppColors.brownishGrey,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Graphik",
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    textAlign: TextAlign.left,
                  ),
                  const Text(
                    "CREDITS",
                    style: TextStyle(
                        color: AppColors.brownishGrey,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Graphik",
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    textAlign: TextAlign.left,
                  ),
                  Container(),
                ])
              ],
            );
          }
          return SelectPlayerTile(
            onTap: (a) {
              onTap();
            },
          );
        });
  }
}
