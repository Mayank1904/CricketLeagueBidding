import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/requests/register_request.dart';
import '../../../domain/models/responses/register_response.dart';
import '../../../domain/respositories/skipper_api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../base_cubit.dart';

part 'register_state.dart';

class RegisterCubit extends BaseCubit<RegisterState, RegisterResponse> {
  final SkipperApiRepository _apiRepository;

  RegisterCubit(this._apiRepository)
      : super(const RegisterStateLoading(), [] as RegisterResponse);

  Future<void> doRegister() async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.doRegister(
        request: const RegisterRequest(),
      );

      if (response is DataSuccess) {
        emit(const RegisterStateSuccess());
      } else if (response is DataFailed) {
        emit(RegisterStateFailed(error: response.error));
      }
    });
  }
}
