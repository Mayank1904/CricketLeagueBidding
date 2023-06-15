import 'package:flutter/material.dart';

import '../../../domain/models/responses/contest.dart';
import '../../../resources/constants/colors.dart';
import '../../components/skipper_text.dart';

class ContestTile extends StatelessWidget {
  final Contest contest;
  const ContestTile(this.contest, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
              color: Color(0x0a000000), offset: Offset(0, 3), blurRadius: 4)
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 320,
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 5.0, bottom: 5.0),
            decoration: const BoxDecoration(
              color: AppColors.greyF5,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: 5.0,
                      ),
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, border: Border.all()),
                      child: Center(
                        child: SkipperText.textExtraSmall("1st"),
                      ),
                    ),
                    SkipperText.textSmall(
                      "₹${contest.enteryfee}",
                      color: AppColors.blackTwo,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: SkipperText.textSmall(
                        "${contest.wining_percentage}%",
                        color: AppColors.blackTwo,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: 5.0,
                      ),
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, border: Border.all()),
                      child: const Center(
                        child: Icon(size: 15.0, Icons.check),
                      ),
                    ),
                    SkipperText.textSmall(
                      "Guaranteed",
                      color: AppColors.blackTwo,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
            child: Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SkipperText.textSmall(
                        "Prize Pool",
                        color: AppColors.brownishGrey,
                      ),
                      SkipperText.textSmall(
                        "Entry",
                        color: AppColors.brownishGrey,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        contest.prizepool,
                        style: const TextStyle(
                          fontFamily: 'Graphik',
                          color: Color(0xff000000),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 17.0,
                        ),
                        decoration: BoxDecoration(
                            color: const Color(0xffc1a621),
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          "₹${contest.enteryfee}",
                          style: const TextStyle(
                            fontFamily: 'Graphik',
                            color: Color(0xffffffff),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: const LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Color(0xffc1a621)),
                        backgroundColor: Color(0xfffce0df),
                        value: 0.08,
                        minHeight: 4.0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SkipperText.textSmall(
                        "${contest.spotsleft} spots left",
                        color: AppColors.darkYellow,
                      ),
                      SkipperText.textSmall(
                        "${contest.totalspots} spots",
                        color: AppColors.brownishGrey,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
