part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  final String? phoneNumberValidationMsg;
  final DioError? error;
  const RegisterState({this.error, this.phoneNumberValidationMsg});

  @override
  List<Object> get props => [error!];
}

class RegisterStateLoading extends RegisterState {
  const RegisterStateLoading();
}

class RegisterStateSuccess extends RegisterState {
  const RegisterStateSuccess({super.phoneNumberValidationMsg});
}

class RegisterStateFailed extends RegisterState {
  const RegisterStateFailed({super.error, super.phoneNumberValidationMsg});
}
