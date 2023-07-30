import 'package:flutter/material.dart';
import '../../resources/constants/colors.dart';
import 'skipper_app_bar.dart';

class SkipperScaffold extends StatelessWidget {
  final Key? scaffoldKey;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Color? backgroundColor;
  final SkipperAppbar? appBar;
  const SkipperScaffold({
    super.key,
    this.scaffoldKey,
    this.backgroundColor,
    this.body,
    this.floatingActionButton,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      backgroundColor: backgroundColor ?? AppColors.backgroundColor,
      appBar: appBar,
      key: scaffoldKey,
      body: body != null
          ? SafeArea(
              child: body!,
            )
          : body!,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
