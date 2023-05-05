part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  final String? phoneNumberValidationMsg;
  final DioError? error;
  final bool? isApiSuccess;
  final bool? isOtpVerified;
  const RegisterState({
    this.error,
    this.phoneNumberValidationMsg,
    this.isApiSuccess = false,
    this.isOtpVerified,
  });

  @override
  List<Object?> get props => [error, phoneNumberValidationMsg, isApiSuccess];
}

class RegisterStateInitial extends RegisterState {
  const RegisterStateInitial();
}

class RegisterStateLoading extends RegisterState {
  const RegisterStateLoading();
}

class RegisterStateSuccess extends RegisterState {
  const RegisterStateSuccess(
      {super.phoneNumberValidationMsg, super.isApiSuccess});
}

class RegisterStateFailed extends RegisterState {
  const RegisterStateFailed({super.error, super.phoneNumberValidationMsg});
}
