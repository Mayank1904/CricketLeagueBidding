import 'package:flutter/material.dart';

import '../../../domain/models/responses/matches_detail_response.dart';
import '../../../resources/constants/colors.dart';
import '../../components/skipper_text.dart';

class PlayerIcon extends StatelessWidget {
  const PlayerIcon({
    Key? key,
    required this.player,
    required this.i,
    required this.playerType,
  }) : super(key: key);

  final List<Player> player;
  final int i;
  final String playerType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/$playerType.jpg',
                  height: 54.0,
                  width: 54.0,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 2,
              right: 2,
              child: Container(
                padding: const EdgeInsets.all(2.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: (i % 2) == 0 ? AppColors.royalPurple : AppColors.white,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 25.0,
                    )
                  ],
                ),
                child: SkipperText.textExtraSmall(
                  player[i].card_name ?? '',
                  color: (i % 2) == 0 ? AppColors.white : AppColors.black,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        // 9 Cr
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Opacity(
            opacity: 0.8,
            child: SkipperText.textSmall(
              "${player[i].credit_value ?? ''} Cr",
              color: AppColors.white,
              textAlign: TextAlign.left,
            ),
          ),
        )
      ],
    );
  }
}
