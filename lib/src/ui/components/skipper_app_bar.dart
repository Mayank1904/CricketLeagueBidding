import 'package:flutter/material.dart';
import 'package:skipper11/src/resources/constants/colors.dart';

class SkipperAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onClose;
  final VoidCallback? onGoBack;
  final String? title;
  final String? subTitle;
  final double barHeight;
  static const double defaultBarHeight = 56;

  SkipperAppbar(
      {Key? key,
      this.onClose,
      this.barHeight = defaultBarHeight,
      this.onGoBack,
      this.title,
      this.subTitle})
      : preferredSize = Size.fromHeight(barHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.backgroundColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColor.yellow),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(title ?? '',
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.14,
              fontFamily: "Graphik",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          textAlign: TextAlign.left),
      titleSpacing: 0,
      automaticallyImplyLeading: false,
    );
  }

  @override
  final Size preferredSize;
}
