import 'package:flutter/material.dart';

import '../../../resources/constants/colors.dart';

class SliderWidget extends StatelessWidget {
  String image, title, description;

  //Constructor created
  SliderWidget(
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
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: AppColors.white),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteGrey),
          ),
        ],
      ),
    );
  }
}
