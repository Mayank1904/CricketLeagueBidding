import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/skipper_scaffold.dart';
import '../components/skipper_text.dart';
import '../components/text_field_widget.dart';
import 'profile_screen.dart';
import 'widgets/select_player_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        title: AppLocalizations.of(context).logIn,
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
                            label: Text(AppLocalizations.of(context).facebook),
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
                            label: Text(AppLocalizations.of(context).google)),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SkipperText.titleBold(
                          AppLocalizations.of(context).or,
                          color: AppColors.white,
                        )),
                  ),
                  TextFieldWidget(
                    hintValue: AppLocalizations.of(context).mobileNo,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SkipperText.textSmall(
                      AppLocalizations.of(context).receiveOtpVerification,
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
                  text: AppLocalizations.of(context).next,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        style: const TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Graphik",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0),
                        text: AppLocalizations.of(context).notAMember),
                    TextSpan(
                        style: const TextStyle(
                            color: AppColors.yellow,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Graphik",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0),
                        text: AppLocalizations.of(context).register)
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
