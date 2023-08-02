import 'package:flutter/material.dart';
import '../../../resources/constants/colors.dart';
import '../../../domain/models/responses/matches_detail_response.dart';
import '../../components/skipper_text.dart';

import '../../../resources/constants/text_styles.dart';

class SelectPlayerTile extends StatelessWidget {
  final int? position;
  final Function onTap;
  final bool? isSelected;
  final Player? player;
  const SelectPlayerTile(
      {super.key,
      required this.onTap,
      this.isSelected,
      this.position,
      this.player});

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: FlexColumnWidth(6.5),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1.5),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: isSelected == true ? AppColors.orange : AppColors.white,
          ),
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8.0, bottom: 2.0),
                        child: Image.asset(
                          'assets/images/player.jpg',
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.center,
                          width: 36,
                          height: 14,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x29000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 25.0)
                            ],
                          ),
                          child: SkipperText.textSmall(
                            player?.team_key ?? '',
                            color: AppColors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Alyssa Healy
                        Text(
                          player?.name ?? '',
                          softWrap: true,
                          style: AppTextStyles.normalBlackw600,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        // Sel by 10.09%
                        Text(
                          "Sel by ${player?.selectedByPercentage ?? ''}%",
                          style: AppTextStyles.smallNormalGreyw400,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5.0),
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (player?.isPlaying == true)
                                    ? AppColors.green
                                    : AppColors.red,
                              ),
                            ), // Announced
                            Text(
                              (player?.isPlaying == true) ? "Announced" : '',
                              style: const TextStyle(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Graphik",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 0
            Center(
              child: Text(
                player?.score.toString() ?? '',
                style: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
                textAlign: TextAlign.left,
              ),
            ),
            // 9.0
            Center(
              child: Text(
                player?.credit_value.toString() ?? '',
                style: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0),
                textAlign: TextAlign.left,
              ),
            ),
            InkWell(
              onTap: () {
                onTap(player, position);
              },
              child: isSelected ?? false
                  ? Image.asset(
                      'assets/images/minus.png',
                      width: 21.0,
                      height: 21.0,
                    )
                  : Image.asset(
                      'assets/images/plus.png',
                      width: 21.0,
                      height: 21.0,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
