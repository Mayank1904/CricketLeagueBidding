import 'package:flutter/material.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import '../../resources/constants/colors.dart';

class SkipperButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isInProgress;
  final Color? buttonColor;
  final bool? isDisabled;
  const SkipperButton(
      {super.key,
      required this.text,
      this.buttonColor,
      this.onPressed,
      this.isInProgress = false,
      this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      key: key,
      onTapUp: isDisabled == false ? onPressed : null,
      color: buttonColor ?? AppColors.yellow,
      disabledColor: AppColors.warmGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              selectionColor: AppColors.yellow,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
