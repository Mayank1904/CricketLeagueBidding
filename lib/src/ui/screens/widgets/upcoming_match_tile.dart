import 'package:flutter/material.dart';
import 'package:skipper11/src/resources/constants/colors.dart';

class UpcomingMatchTile extends StatelessWidget {
  const UpcomingMatchTile({super.key});

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
              spreadRadius: 0),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
                  child: Text(
                    "Womens Premier League 2023",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Graphik',
                      color: Color(0xff333333),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  color: Color(0xffededed),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9.0, left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/man.png',
                                width: 30,
                                height: 28,
                                fit: BoxFit.cover,
                              ),
                              const Text(
                                "Mumbai",
                                style: TextStyle(
                                  fontFamily: 'Graphik',
                                  color: Color(0xff17001d),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              )
                            ],
                          ),
                          const Text(
                            "MUM",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Graphik',
                              color: Color(0xff000000),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "24 March,2023",
                        style: TextStyle(
                          fontFamily: 'Graphik',
                          color: Color(0xff666666),
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            "GUJR",
                            style: TextStyle(
                              fontFamily: 'Graphik',
                              color: Color(0xff000000),
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/man.png',
                                width: 30,
                                height: 28,
                                fit: BoxFit.cover,
                              ),
                              const Text(
                                "Gujarat",
                                style: TextStyle(
                                  fontFamily: 'Graphik',
                                  color: Color(0xff17001d),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              )
                            ],
                          ),
                        ],
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
