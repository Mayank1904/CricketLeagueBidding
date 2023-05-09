import 'package:flutter/material.dart';
import '../components/skipper_scaffold.dart';
import '../components/text_field_widget.dart';

import '../../resources/constants/colors.dart';
import '../components/skipper_button.dart';
import '../components/skipper_text.dart';
import 'home_screen.dart';

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
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/man.png",
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
                    isNumeric: false,
                    hintValue: 'Enter Name',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Graphik",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          text: "NOTE: "),
                      TextSpan(
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Graphik",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          text:
                              "We will use this to generate a name for Your Team. You can change your team’s name later.")
                    ])),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SkipperButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    )
                  },
                  text: 'SAVE NAME',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: SkipperButton(
                    onPressed: () => {},
                    buttonColor: AppColors.warmGrey,
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
