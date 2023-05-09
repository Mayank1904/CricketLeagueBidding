part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final String? phoneNumberValidationMsg;
  final DioError? error;
  final bool? isApiSuccess;
  final bool? isApiError;
  final bool? isOtpVerified;
  final bool? isTermsConditionChecked;
  final bool? isPhoneNumberValid;
  final bool? isAllValid;
  final bool? isUserRegistered;
  final bool? isUserLogin;
  final bool? isLoading;
  final UserResponse? user;
  const RegisterState({
    this.error,
    this.isApiError,
    this.phoneNumberValidationMsg = "",
    this.isApiSuccess = false,
    this.isOtpVerified = false,
    this.isTermsConditionChecked = false,
    this.isAllValid = false,
    this.isPhoneNumberValid = false,
    this.user,
    this.isUserRegistered,
    this.isUserLogin,
    this.isLoading,
  });

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
        isUserLogin,
        isUserRegistered,
        isLoading,
        isApiError,
      ];

  RegisterState copyWith({
    String? phoneNumberValidationMsg,
    DioError? error,
    bool? isApiSuccess,
    bool? isOtpVerified,
    bool? isTermsConditionChecked,
    bool? isAllValid,
    bool? isPhoneNumberValid,
    UserResponse? user,
    bool? isUserRegistered,
    bool? isUserLogin,
    bool? isLoading,
    bool? isApiError,
  }) {
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
        isUserLogin: isUserLogin ?? this.isUserLogin,
        isUserRegistered: isUserRegistered ?? this.isUserRegistered,
        isLoading: isLoading ?? this.isLoading,
        isApiError: isApiError ?? this.isApiError);
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
