import 'package:flutter/material.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import '../../resources/constants/colors.dart';

class SkipperButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isInProgress;
  const SkipperButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.isInProgress = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 40,
        child: NeoPopButton(
          key: key,
          onTapUp: onPressed,
          color: AppColors.yellow,
          disabledColor: AppColors.warmGrey,
          child: Text(
            text,
            selectionColor: AppColors.yellow,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ));
  }
}
