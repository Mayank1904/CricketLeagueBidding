import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skipper11/src/ui/screens/widgets/contest_tile.dart';

import '../../../resources/constants/colors.dart';
import '../../components/skipper_app_bar.dart';
import '../../components/skipper_scaffold.dart';
import 'chip.dart';

class SelectMatchScreen extends StatelessWidget {
  const SelectMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SkipperScaffold(
      appBar: SkipperAppbar(
        title: 'MUM vs GUJR',
        subTitle: '1h 51m left',
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.wallet_giftcard,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  chip('Contests', const Color(0xff252525)),
                  chip('My Contests(0)', const Color(0xff252525)),
                  chip('My Team(0)', const Color(0xff252525)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Mega Contest",
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Graphik",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left,
                    ),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          style: TextStyle(
                              color: Color(0xffb5b5b5),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Graphik",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          text: "Sort By: "),
                      TextSpan(
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Graphik",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          text: "Entry")
                    ]))
                  ],
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (ctx, index) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: ContestTile(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
