import 'package:flutter/material.dart';
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
        child: ElevatedButton(
          key: key,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.black,
            backgroundColor: AppColors.yellow,
            disabledBackgroundColor: AppColors.warmGrey,
            textStyle: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: Text(
            text,
            selectionColor: AppColors.yellow,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ));
  }
}
