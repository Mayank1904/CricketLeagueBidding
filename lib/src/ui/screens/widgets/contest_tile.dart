import 'package:flutter/material.dart';

class ContestTile extends StatelessWidget {
  const ContestTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
              color: Color(0x0a000000),
              offset: Offset(0, 3),
              blurRadius: 4,
              spreadRadius: 0)
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
            child: Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Prize Pool",
                        style: TextStyle(
                          fontFamily: 'Graphik',
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Text(
                        "Entry",
                        style: TextStyle(
                          fontFamily: 'Graphik',
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "1 Crore",
                        style: TextStyle(
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
                        child: const Text(
                          "₹99",
                          style: TextStyle(
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
                        value: 0.4,
                        minHeight: 4.0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "3,387 spots left",
                        style: TextStyle(
                          fontFamily: 'Graphik',
                          color: Color(0xffc1a621),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Text(
                        "3,390 spots",
                        style: TextStyle(
                          fontFamily: 'Graphik',
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 320,
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 5.0, bottom: 5.0),
            decoration: const BoxDecoration(
              color: Color(0xffeaeaea),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text(
                      "₹9,500",
                      style: TextStyle(
                        fontFamily: 'Graphik',
                        color: Color(0xff333333),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text("63%",
                          style: TextStyle(
                            fontFamily: 'Graphik',
                            color: Color(0xff333333),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ],
                ),
                const Text("Guaranteed",
                    style: TextStyle(
                      fontFamily: 'Graphik',
                      color: Color(0xff333333),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
