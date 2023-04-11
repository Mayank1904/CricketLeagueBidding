import 'package:flutter/material.dart';
import 'package:skipper11/src/resources/constants/colors.dart';

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
            foregroundColor: AppColor.black,
            backgroundColor: AppColor.yellow,
            textStyle:
                const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
          ),
          child: onPressed != null
              ? Baseline(
                  baseline: 15,
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    text,
                    selectionColor: Colors.yellow,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                )
              : Baseline(
                  baseline: 15,
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    text,
                    selectionColor: Colors.yellow,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
        ));
  }
}
