import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/skipper_scaffold.dart';
import '../components/skipper_text.dart';
import '../components/text_field_widget.dart';
import 'profile_screen.dart';
import 'widgets/select_player_tile.dart';

import '../../resources/constants/colors.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_button.dart';

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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  AppColors.waterBlue, // Background color
                            ),
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.facebook),
                            label: Text('Facebook'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.white,
                                foregroundColor: AppColors.black
                                // Background color
                                ),
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.googlePlusG),
                            label: Text('Google')),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SkipperText.titleBold(
                          "Or",
                          color: AppColors.white,
                        )),
                  ),
                  const TextFieldWidget(
                    hintValue: 'Mobile No.',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SkipperText.textSmall(
                      "You will receive an OTP for verification",
                      color: AppColors.white,
                      textAlign: TextAlign.left)
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
                          builder: (context) => const ProfileScreen()),
                    )
                  },
                  text: 'NEXT',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Graphik",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0),
                        text: "Not a member? "),
                    TextSpan(
                        style: TextStyle(
                            color: AppColors.yellow,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Graphik",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0),
                        text: "Register")
                  ])),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
