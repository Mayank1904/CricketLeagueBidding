import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/skipper_checkbox.dart';
import '../components/skipper_scaffold.dart';
import '../components/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_button.dart';
import '../components/skipper_text.dart';
import '../cubits/register/register_cubit.dart';

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
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
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
                        hintValue: AppLocalizations.of(context).mobileNo,
                        onChanged: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SkipperText.textSmall(
                          AppLocalizations.of(context).receiveOtpVerification,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SkipperButton(
                      onPressed: () => {registerCubit.doRegister()},
                      text: AppLocalizations.of(context).register.toUpperCase(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: SkipperCheckBox(
                          value: true,
                          label: AppLocalizations.of(context).registerAgree),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
