import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import '../components/skipper_checkbox.dart';
import '../components/skipper_scaffold.dart';
import '../components/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_button.dart';
import '../components/skipper_text.dart';
import '../cubits/register/register_cubit.dart';
import 'profile_screen.dart';
import 'widgets/otp_widget.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);
    return SkipperScaffold(
        appBar: SkipperAppbar(
          title: AppLocalizations.of(context).registerAndPlay,
        ),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterStateSuccess) {
              if (state.isApiSuccess!) {
                Navigator.of(context).pop();
                if (state.isOtpVerified!) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                }
              }
            } else if (state is RegisterStateFailed) {
              showToast("Something went wrong");
            }
          },
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.all(20.0),
              child: state.isApiSuccess!
                  ? OtpWidget(
                      otpCode: "123456",
                      onSubmitted: (val) {
                        registerCubit.verify();
                      },
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SkipperText.header(
                                AppLocalizations.of(context).enterMobileNo,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              TextFieldWidget(
                                isNumeric: true,
                                hintValue:
                                    AppLocalizations.of(context).mobileNo,
                                onChanged: (val) {
                                  registerCubit.validatePhone(val);
                                },
                              ),
                              getErrorText(state.phoneNumberValidationMsg),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: SkipperText.textSmall(
                                  AppLocalizations.of(context)
                                      .receiveOtpVerification,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SkipperButton(
                              onPressed: state.phoneNumberValidationMsg == null
                                  ? () => {
                                        showLoaderDialog(context),
                                        registerCubit.doRegister(),
                                      }
                                  : null,
                              text: AppLocalizations.of(context)
                                  .register
                                  .toUpperCase(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: SkipperCheckBox(
                                  value: false,
                                  onChanged: (val) => {},
                                  label: AppLocalizations.of(context)
                                      .registerAgree),
                            )
                          ],
                        ),
                      ],
                    ),
            );
          },
        ));
  }

  Widget getErrorText(String? errorText) {
    return Visibility(
      visible: errorText == null ? false : true,
      child: Text(
        errorText ?? "",
        style: const TextStyle(
          fontSize: 11,
          color: Color(0xFFFF0000),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
