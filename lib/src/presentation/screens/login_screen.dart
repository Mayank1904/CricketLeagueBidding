import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:oktoast/oktoast.dart';
import '../components/skipper_scaffold.dart';
import '../components/skipper_text.dart';
import '../components/text_field_widget.dart';
import '../cubits/register/register_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../resources/constants/colors.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_button.dart';
import 'profile_screen.dart';
import 'widgets/otp_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late RegisterCubit loginCubit;

  @override
  void dispose() {
    // _mobileInputController.dispose();
    loginCubit.initState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loginCubit = BlocProvider.of<RegisterCubit>(context);
    final mobileInputController = TextEditingController();
    late AlertDialog? alertDialog;
    return SkipperScaffold(
      appBar: SkipperAppbar(
        title: AppLocalizations.of(context).logIn,
      ),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.isLoading ?? false) {
            alertDialog = showLoaderDialog(context);
          }
          if (state.isApiSuccess ?? false) {
            // if (alertDialog != null) {
            Navigator.of(context).pop();
            // }
            if (state.user?.message == 'User Already Exist') {
              showToast(state.user?.message ?? 'Something Went Wrong');
            }
            if (state.isOtpVerified ?? false) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            }
          } else if (state.isApiError ?? false) {
            if (alertDialog != null) {
              Navigator.of(context).pop();
            }
            showToast("Something went wrong");
            loginCubit.initState();
          }
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              if (state.isUserLogin ?? false) {
                loginCubit.backToMainScreen();
                return false;
              }
              return true;
            },
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: (state.isUserLogin ?? false)
                  ? OtpWidget(
                      otpCode: "88888",
                      onSubmitted: (val) {
                        loginCubit.verify(val, mobileInputController.text);
                      },
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.waterBlue,
                                        ),
                                        onPressed: () {},
                                        icon: const FaIcon(
                                            FontAwesomeIcons.facebook),
                                        label: Text(AppLocalizations.of(context)
                                            .facebook),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.white,
                                          foregroundColor: AppColors.black,
                                        ),
                                        onPressed: () {},
                                        icon: const FaIcon(
                                            FontAwesomeIcons.googlePlusG),
                                        label: Text(AppLocalizations.of(context)
                                            .google)),
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
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: TextFieldWidget(
                                  controller: mobileInputController,
                                  isNumeric: true,
                                  hintValue:
                                      AppLocalizations.of(context).mobileNo,
                                  onChanged: (val) {
                                    loginCubit.validatePhone(val,
                                        isRegister: false);
                                  },
                                ),
                              ),
                              getErrorText(state.phoneNumberValidationMsg),
                              SkipperText.textSmall(
                                AppLocalizations.of(context)
                                    .receiveOtpVerification,
                                color: AppColors.white,
                                textAlign: TextAlign.left,
                              )
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
                                        loginCubit.doLogin(
                                          mobileInputController.text,
                                        ),
                                      }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SkipperText.bodyBold(
                                      AppLocalizations.of(context)
                                          .next
                                          .toUpperCase(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      style: const TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Graphik",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 13.0),
                                      text: AppLocalizations.of(context)
                                          .notAMember,
                                    ),
                                    TextSpan(
                                      style: const TextStyle(
                                          color: AppColors.yellow,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Graphik",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 13.0),
                                      text:
                                          AppLocalizations.of(context).register,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  AlertDialog? showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(
            color: AppColors.yellow,
          ),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Login...")),
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
    return null;
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
}
