import 'package:flutter/material.dart';
import '../../resources/constants/colors.dart';

class SkipperAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onClose;
  final VoidCallback? onGoBack;
  final String? title;
  final String? subTitle;
  final double barHeight;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? centerTitle;
  static const double defaultBarHeight = 56;

  SkipperAppbar(
      {Key? key,
      this.onClose,
      this.barHeight = defaultBarHeight,
      this.onGoBack,
      this.title,
      this.subTitle,
      this.leading,
      this.actions,
      this.centerTitle = false})
      : preferredSize = Size.fromHeight(barHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      centerTitle: centerTitle,
      leading: leading ??
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.yellow),
            onPressed: () => Navigator.of(context).pop(),
          ),
      actions: actions,
      title: (centerTitle ?? false)
          ? Image.asset(
              'assets/images/skipper_icon.png',
              height: 52,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.14,
                    fontFamily: "Graphik",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  subTitle ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.14,
                    fontFamily: "Graphik",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
      titleSpacing: 0,
      automaticallyImplyLeading: false,
    );
  }

  @override
  final Size preferredSize;
}
