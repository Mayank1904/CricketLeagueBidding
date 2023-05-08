import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../resources/constants/colors.dart';
import '../../components/skipper_text.dart';

class OtpWidget extends StatelessWidget {
  final String? otpCode;
  final Function? onSubmitted;
  final Function? onChanged;
  const OtpWidget(
      {super.key, required this.otpCode, this.onSubmitted, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkipperText.header(
          'Enter the\nOTP you received',
          color: Colors.white,
        ),
        const SizedBox(
          height: 25.0,
        ),
        PinFieldAutoFill(
          codeLength: otpCode?.length ?? 5,
          currentCode: otpCode,
          decoration: BoxLooseDecoration(
            textStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'Graphik',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal),
            radius: Radius.zero,
            bgColorBuilder: const FixedColorBuilder(
              Color(0xFFffffff),
            ),
            strokeColorBuilder: const FixedColorBuilder(
              Color(0xFFFFFFFF),
            ),
          ),
          onCodeChanged: (code) {
            if (code?.length == otpCode?.length) {
              Timer(const Duration(seconds: 5), () {
                // <-- Delay here
                onSubmitted!(code);
              });
            }
          },
          onCodeSubmitted: (val) {
            onSubmitted!(val);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: RichText(
              text: const TextSpan(children: [
            TextSpan(
                style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Graphik",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
                text: "You should receive the OTP in "),
            TextSpan(
                style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Graphik",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
                text: "30 Second")
          ])),
        ),
      ],
    );
  }
}
