import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../components/skipper_text.dart';

class OtpWidget extends StatelessWidget {
  String? otpCode;
  OtpWidget({super.key, required this.otpCode});

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
          currentCode: '123456',
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
          codeLength: 6,
          onCodeChanged: (code) {
            print("OnCodeChanged : $code");
            otpCode = code.toString();
          },
          onCodeSubmitted: (val) {
            print("OnCodeSubmitted : $val");
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: SkipperText.bodySmall(
            'You should receive the OTP in 30 Second',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
