import '../../domain/models/requests/user_auth_request.dart';
import '../../domain/models/responses/upcoming_matches_response.dart';
import '../../domain/models/responses/user_auth_response.dart';
import '../../domain/respositories/skipper_api_repository.dart';
import '../../utils/resources/data_state.dart';
import '../datasources/remote/skipper_api_service.dart';
import 'base/base_api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository
    implements SkipperApiRepository {
  final SkipperApiService _skipperApiService;

  ApiRepositoryImpl(this._skipperApiService);

  @override
  Future<DataState<UserAuthResponse>> doRegister(
      {required UserAuthRequest request}) {
    return getStateOf<UserAuthResponse>(
        request: () => _skipperApiService.register(request: request));
  }

  @override
  Future<DataState<UserAuthResponse>> verify(
      {required UserAuthRequest request, String? token}) {
    return getStateOf<UserAuthResponse>(
        request: () =>
            _skipperApiService.verify(token: token!, request: request));
  }

  @override
  Future<DataState<UserAuthResponse>> loginWithPhone(
      {required UserAuthRequest request}) {
    return getStateOf<UserAuthResponse>(
        request: () => _skipperApiService.loginWithPhone(request: request));
  }

  @override
  Future<DataState<UpcomingMatchesResponse>> upcomingMatches() {
    return getStateOf<UpcomingMatchesResponse>(
        request: () => _skipperApiService.upcomingMatches());
  }
}
