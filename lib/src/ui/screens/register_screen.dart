import 'package:flutter/material.dart';
import 'package:skipper11/src/ui/components/skipper_checkbox.dart';
import 'package:skipper11/src/ui/components/skipper_scaffold.dart';
import 'package:skipper11/src/ui/components/text_field_widget.dart';

import '../components/skipper_app_bar.dart';
import '../components/skipper_button.dart';
import '../components/skipper_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SkipperScaffold(
      appBar: SkipperAppbar(
        title: 'Register & Play',
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkipperText.header(
                    'Enter Your\nMobile Number',
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const TextFieldWidget(
                    hintValue: 'Mobile No.',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SkipperText.bodySmall(
                      'You will receive an OTP for verification',
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
                  text: 'REGISTER',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: SkipperCheckBox(
                      value: true,
                      label: 'By registering, I agree to My Fantasy 11’s T&Cs'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
