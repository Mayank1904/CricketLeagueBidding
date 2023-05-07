part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final String? phoneNumberValidationMsg;
  final DioError? error;
  final bool? isApiSuccess;
  final bool? isOtpVerified;
  final bool? isTermsConditionChecked;
  final bool? isPhoneNumberValid;
  final bool? isAllValid;
  final UserResponse? user;
  const RegisterState(
      {this.error,
      this.phoneNumberValidationMsg = "",
      this.isApiSuccess = false,
      this.isOtpVerified = false,
      this.isTermsConditionChecked = false,
      this.isAllValid = false,
      this.isPhoneNumberValid = false,
      this.user});

  @override
  List<Object?> get props => [
        error,
        phoneNumberValidationMsg,
        isApiSuccess,
        isOtpVerified,
        isTermsConditionChecked,
        isAllValid,
        isPhoneNumberValid,
        user,
      ];

  RegisterState copyWith(
      {String? phoneNumberValidationMsg,
      DioError? error,
      bool? isApiSuccess,
      bool? isOtpVerified,
      bool? isTermsConditionChecked,
      bool? isAllValid,
      bool? isPhoneNumberValid,
      UserResponse? user}) {
    return RegisterState(
      phoneNumberValidationMsg:
          phoneNumberValidationMsg ?? this.phoneNumberValidationMsg,
      error: error ?? this.error,
      isApiSuccess: isApiSuccess ?? this.isApiSuccess,
      isOtpVerified: isOtpVerified ?? this.isOtpVerified,
      isTermsConditionChecked:
          isTermsConditionChecked ?? this.isTermsConditionChecked,
      isAllValid: isAllValid ?? this.isAllValid,
      isPhoneNumberValid: isPhoneNumberValid ?? this.isPhoneNumberValid,
      user: user ?? this.user,
    );
  }
}

class RegisterStateInitial extends RegisterState {
  const RegisterStateInitial();
}

class RegisterStateLoading extends RegisterState {
  const RegisterStateLoading();
}

class RegisterStateSuccess extends RegisterState {
  const RegisterStateSuccess(
      {super.phoneNumberValidationMsg, super.isApiSuccess, super.user});
}

class RegisterStateFailed extends RegisterState {
  const RegisterStateFailed({super.error, super.phoneNumberValidationMsg});
}
