import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skipper11/src/ui/components/skipper_scaffold.dart';
import 'package:skipper11/src/ui/components/text_field_widget.dart';
import 'package:skipper11/src/ui/screens/widgets/otp_widget.dart';
import 'package:skipper11/src/ui/screens/widgets/upcoming_match_tile.dart';

import '../components/skipper_app_bar.dart';
import '../components/skipper_button.dart';
import '../components/skipper_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SkipperScaffold(
      appBar: SkipperAppbar(
        title: 'Log In',
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            UpcomingMatchTile(),
            Column(
              children: [
                SkipperButton(
                  onPressed: () => {},
                  text: 'NEXT',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SkipperText.bodySmall('Not a member? Register'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
