import 'package:flutter/material.dart';
import '../../components/skipper_text.dart';

import '../../../resources/constants/colors.dart';

class SliderWidget extends StatelessWidget {
  final String image, title, description;

  //Constructor created
  const SliderWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(image)),
          const SizedBox(height: 30),
          SkipperText.header(
            title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          SkipperText.textSmall(
            description,
            textAlign: TextAlign.center,
            color: AppColors.whiteGrey,
          ),
        ],
      ),
    );
  }
}
