part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  final DioError? error;
  const RegisterState({
    this.error,
  });

  @override
  List<Object> get props => [error!];
}

class RegisterStateLoading extends RegisterState {
  const RegisterStateLoading();
}

class RegisterStateSuccess extends RegisterState {
  const RegisterStateSuccess();
}

class RegisterStateFailed extends RegisterState {
  const RegisterStateFailed({super.error});
}
