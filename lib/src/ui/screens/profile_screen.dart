import 'package:flutter/material.dart';
import 'package:skipper11/src/ui/components/skipper_checkbox.dart';
import 'package:skipper11/src/ui/components/skipper_scaffold.dart';
import 'package:skipper11/src/ui/components/text_field_widget.dart';

import '../components/skipper_app_bar.dart';
import '../components/skipper_button.dart';
import '../components/skipper_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SkipperScaffold(
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/man_2.png",
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Center(
                    child: SkipperText.header(
                      'Let’s get you started!',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const TextFieldWidget(
                    hintValue: 'Enter Name',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SkipperText.bodySmall(
                      'NOTE: We will use this to generate a name for Your Team.You can change your team’s name later.',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SkipperButton(
                  onPressed: () => {},
                  text: 'SAVE NAME',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: SkipperButton(
                    onPressed: () => {},
                    text: 'SKIP FOR NOW',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
