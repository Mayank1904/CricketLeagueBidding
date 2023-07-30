import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/models/responses/card.dart';
import '../../../resources/constants/colors.dart';
import '../../components/skipper_text.dart';

class UpcomingMatchTile extends StatelessWidget {
  final Cards card;
  const UpcomingMatchTile(
    this.card, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0a000000),
            offset: Offset(0, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: SkipperText.textSmall(
                      card.season.name,
                      color: AppColors.blackTwo,
                      textAlign: TextAlign.start,
                    )),
                const Divider(
                  height: 1,
                  color: AppColors.greyED,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9.0, left: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/image_14.png',
                                width: 30,
                                height: 28,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SkipperText.titleBold(
                                  card.teams.a.shortName,
                                  color: AppColors.black,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SkipperText.textSmall(
                            card.teams.a.name.split(' ')[0],
                            color: AppColors.backgroundColor,
                          ),
                        ],
                      ),
                      SkipperText.textExtraSmall(
                        DateFormat('d MMMM,yyyy')
                            .format(DateTime.parse(card.startDate.iso)),
                        color: AppColors.brownishGrey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: SkipperText.titleBold(
                                    card.teams.b.shortName,
                                    color: AppColors.black,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/scroll_group_2.png',
                                  width: 30,
                                  height: 28,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            SkipperText.textSmall(
                              card.teams.b.name.split(' ')[0],
                              color: AppColors.backgroundColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)),
              color: Color(0xffeaeaea),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 6.0),
                  child: Text(
                    'MEGA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      background: Paint()
                        ..color = const Color(0xffd8fecd)
                        ..strokeWidth = 4
                        ..strokeCap = StrokeCap.round
                        ..style = PaintingStyle.fill,
                      color: const Color(0xff51904a),
                    ),
                  ),
                ),
                const Text(
                  "10 Lakhs",
                  style: TextStyle(
                    fontFamily: 'Graphik',
                    color: Color(0xff17001d),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
