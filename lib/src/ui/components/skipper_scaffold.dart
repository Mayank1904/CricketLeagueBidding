import 'package:flutter/material.dart';
import 'package:skipper11/src/resources/constants/colors.dart';
import 'package:skipper11/src/ui/components/skipper_app_bar.dart';

class SkipperScaffold extends StatelessWidget {
  final Key? scaffoldKey;
  final Widget? body;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final SkipperAppbar? appBar;
  const SkipperScaffold(
      {super.key,
      this.scaffoldKey,
      this.backgroundColor,
      this.body,
      this.floatingActionButton,
      this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor ?? AppColor.backgroundColor,
        appBar: appBar,
        key: scaffoldKey,
        body: body != null
            ? SafeArea(
                child: Expanded(
                  child: body!,
                ),
              )
            : body!);
  }
}
