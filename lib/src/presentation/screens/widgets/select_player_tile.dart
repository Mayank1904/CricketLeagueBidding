import 'package:flutter/material.dart';
import '../../../resources/constants/colors.dart';
import '../../components/skipper_text.dart';

import '../../../resources/constants/text_styles.dart';

class SelectPlayerTile extends StatelessWidget {
  const SelectPlayerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(
        color: AppColors.white,
        width: 2.0,
      ),
      columnWidths: const {
        0: FlexColumnWidth(4.5),
        1: FlexColumnWidth(1.5),
        2: FlexColumnWidth(1.5),
        3: FlexColumnWidth(2),
      },
      children: [
        TableRow(
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
                                  blurRadius: 25.0,
                                  spreadRadius: 0)
                            ],
                          ),
                          child: SkipperText.textSmall(
                            'MUM',
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
                        const Text(
                          "Alyssa Healy",
                          style: AppTextStyles.normalBlackw600,
                        ),
                        // Sel by 10.09%
                        const Text(
                          "Sel by 10.09%",
                          style: AppTextStyles.smallNormalGreyw400,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5.0),
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.red,
                              ),
                            ), // Announced
                            const Text(
                              "Announced",
                              style: TextStyle(
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
            const Center(
              child: Text(
                "0",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
                textAlign: TextAlign.left,
              ),
            ),
            // 9.0
            const Center(
              child: Text(
                "9.0",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0),
                textAlign: TextAlign.left,
              ),
            ),
            Image.asset(
              'assets/images/player.jpg',
              width: 21.0,
              height: 21.0,
            ),
          ],
        ),
      ],
    );
  }
}
