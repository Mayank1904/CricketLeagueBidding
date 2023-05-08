import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:oktoast/oktoast.dart';
import '../../resources/constants/colors.dart';
import '../components/skipper_checkbox.dart';
import '../components/skipper_scaffold.dart';
import '../components/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_text.dart';
import '../cubits/register/register_cubit.dart';
import 'profile_screen.dart';
import 'widgets/otp_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _mobileInputController = TextEditingController();
  late RegisterCubit registerCubit;
  @override
  void dispose() {
    _mobileInputController.dispose();
    registerCubit.initState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    registerCubit = BlocProvider.of<RegisterCubit>(context);
    return SkipperScaffold(
        appBar: SkipperAppbar(
          title: AppLocalizations.of(context).registerAndPlay,
        ),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state.isApiSuccess ?? false) {
              Navigator.of(context).pop();
              if (state.user?.message == 'User Already Exist') {
                showToast(state.user?.message ?? 'Something Went Wrong');
              }
              if (state.isOtpVerified ?? false) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              }
            } else if (state.error?.message != null) {
              showToast("Something went wrong");
            }
          },
          builder: (context, state) {
            return WillPopScope(
              onWillPop: () async {
                registerCubit.backToMainScreen();
                return true;
              },
              child: Container(
                margin: const EdgeInsets.all(20.0),
                child: ((state.isApiSuccess ?? false) &&
                        state.user?.message != 'User Already Exist')
                    ? OtpWidget(
                        otpCode: "88888",
                        onSubmitted: (val) {
                          registerCubit.verify(
                              val, _mobileInputController.text);
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
                                  controller: _mobileInputController,
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
                              NeoPopButton(
                                  color: AppColors.yellow,
                                  disabledColor: AppColors.shadowGrey,
                                  bottomShadowColor: state.isAllValid ?? false
                                      ? AppColors.darkYellow
                                      : AppColors.shadowGrey2,
                                  onTapUp: state.isAllValid ?? false
                                      ? () => {
                                            showLoaderDialog(context),
                                            registerCubit.doRegister(
                                              _mobileInputController.text,
                                            ),
                                          }
                                      : null,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SkipperText.bodyBold(
                                          AppLocalizations.of(context)
                                              .register
                                              .toUpperCase(),
                                        ),
                                      ],
                                    ),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: SkipperCheckBox(
                                    value:
                                        state.isTermsConditionChecked ?? false,
                                    onChecked: (val) => {
                                          registerCubit
                                              .checkTermsAndConditions(val),
                                        },
                                    label: AppLocalizations.of(context)
                                        .registerAgree),
                              )
                            ],
                          ),
                        ],
                      ),
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
          const CircularProgressIndicator(
            color: AppColors.yellow,
          ),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Waiting...")),
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
