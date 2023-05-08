import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/requests/user_auth_request.dart';
import '../../../domain/models/responses/login_response.dart';
import '../../../domain/models/responses/user_auth_response.dart';
import '../../../domain/models/responses/user_response.dart';
import '../../../domain/respositories/skipper_api_repository.dart';
import '../../../utils/auth_service.dart';
import '../../../utils/resources/data_state.dart';
import '../../../utils/validations/validations.dart';
import '../base_cubit.dart';

part 'register_state.dart';

class RegisterCubit extends BaseCubit<RegisterState, UserAuthResponse>
    with ValidationMixin {
  final SkipperApiRepository _apiRepository;
  final AuthService authService;

  RegisterCubit(this._apiRepository, this.authService)
      : super(const RegisterState(), const UserAuthResponse());

  void initState() {
    emit(const RegisterStateInitial());
  }

  void backToMainScreen() {
    emit(state.copyWith(isApiSuccess: false));
  }

  Future<void> doRegister(String? mobileNo) async {
    if (isBusy) return;

    await run(() async {
      emit(const RegisterStateLoading());
      var userReq = {};
      userReq["mobileNo"] = mobileNo;
      userReq["countryCode"] = "+91";
      userReq["source"] = "REGISTER";
      var base64Encode = base64.encode(utf8.encode(jsonEncode(userReq)));
      final response = await _apiRepository.doRegister(
        request: UserAuthRequest(
          apiBody: base64Encode,
        ),
      );

      if (response is DataSuccess) {
        var res = utf8.decode(base64.decode(response.data!.apiResponse!));
        var userAuthRes = UserResponse.fromJson(res);
        emit(state.copyWith(isApiSuccess: true, user: userAuthRes));
      } else if (response is DataFailed) {
        emit(state.copyWith(isApiSuccess: false, error: response.error));
      }
    });
  }

  Future<void> doLogin(String mobileNo) async {
    if (isBusy) return;

    await run(() async {
      emit(const RegisterStateLoading());
      var userReq = {};
      userReq["mobileNo"] = mobileNo;
      userReq["countryCode"] = "+91";
      var base64Encode = base64.encode(utf8.encode(jsonEncode(userReq)));
      final response = await _apiRepository.loginWithPhone(
        request: UserAuthRequest(
          apiBody: base64Encode,
        ),
      );

      if (response is DataSuccess) {
        var res = utf8.decode(base64.decode(response.data!.apiResponse!));
        var userAuthRes = LoginResponse.fromJson(res);
        await authService.setToken(userAuthRes.access_token);
        emit(state.copyWith(isApiSuccess: true));
      } else if (response is DataFailed) {
        emit(state.copyWith(isApiSuccess: false, error: response.error));
      }
    });
  }

  Future<void> verify(String otp, String mobileNo) async {
    if (isBusy) return;

    await run(() async {
      emit(const RegisterStateLoading());
      var userReq = {};
      userReq["mobileNo"] = mobileNo;
      userReq["otp"] = otp;
      var base64Encode = base64.encode(utf8.encode(jsonEncode(userReq)));
      var token = await authService.getToken();
      final response = await _apiRepository.verify(
        token: token,
        request: UserAuthRequest(
          apiBody: base64Encode,
        ),
      );

      if (response is DataSuccess) {
        var res = utf8.decode(base64.decode(response.data!.apiResponse!));
        var userAuthRes = UserResponse.fromJson(res);
        emit(state.copyWith(isApiSuccess: true, user: userAuthRes));
      } else if (response is DataFailed) {
        emit(state.copyWith(isApiSuccess: false, error: response.error));
      }
    });
  }

  Future<void> validatePhone(String? phoneNumber,
      {bool isRegister = true}) async {
    if (isBusy) return;
    emit(state.copyWith(phoneNumberValidationMsg: ""));
    await run(() async {
      final res = validateMobile(phoneNumber);
      emit(state.copyWith(
          isPhoneNumberValid: res == null,
          phoneNumberValidationMsg: res,
          isAllValid: isRegister ? isValid(res: res) : isValidLogin(res)));
    });
  }

  Future<void> checkTermsAndConditions(bool checked) async {
    if (isBusy) return;
    await run(() async {
      state.copyWith(isTermsConditionChecked: checked);
      emit(state.copyWith(
          isTermsConditionChecked: checked,
          isAllValid: isValid(checked: checked)));
    });
  }

  bool isValid({String? res, bool? checked}) {
    if ((checked ?? false) && (res == null)) {
      return true;
    }
    return false;
  }

  bool isValidLogin([String? res]) {
    if (res == null) {
      return true;
    }
    return false;
  }
}
