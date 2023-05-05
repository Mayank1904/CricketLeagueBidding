import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/requests/register_request.dart';
import '../../../domain/models/responses/register_response.dart';
import '../../../domain/respositories/skipper_api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../../../utils/validations/validations.dart';
import '../base_cubit.dart';

part 'register_state.dart';

class RegisterCubit extends BaseCubit<RegisterState, RegisterResponse>
    with ValidationMixin {
  final SkipperApiRepository _apiRepository;

  RegisterCubit(this._apiRepository)
      : super(const RegisterStateInitial(), const RegisterResponse());

  Future<void> doRegister() async {
    if (isBusy) return;

    await run(() async {
      emit(const RegisterStateLoading());
      final response = await _apiRepository.doRegister(
        request: const RegisterRequest(
          apiBody:
              "eyJtb2JpbGVObyI6ICI5OTk2NDcwMDAxIiwiY291bnRyeUNvZGUiOiAiKzkxIiwic291cmNlIjoiUkVHSVNURVIifQ==",
        ),
      );

      if (response is DataSuccess) {
        emit(const RegisterStateSuccess(isApiSuccess: true));
      } else if (response is DataFailed) {
        emit(RegisterStateFailed(error: response.error));
      }
    });
  }

  Future<void> verify() async {
    if (isBusy) return;

    await run(() async {
      emit(const RegisterStateLoading());
      final response = await _apiRepository.verify(
        request: const RegisterRequest(
          apiBody:
              "eyJtb2JpbGVObyI6ICI5OTk2NDcwMDAxIiwiY291bnRyeUNvZGUiOiAiKzkxIiwic291cmNlIjoiUkVHSVNURVIifQ==",
        ),
      );

      if (response is DataSuccess) {
        emit(const RegisterStateSuccess(isApiSuccess: true));
      } else if (response is DataFailed) {
        emit(RegisterStateFailed(error: response.error));
      }
    });
  }

  Future<void> validatePhone(String? phoneNumber) async {
    if (isBusy) return;

    await run(() async {
      final res = validateMobile(phoneNumber);
      emit(RegisterStateSuccess(phoneNumberValidationMsg: res));
    });
  }
}
