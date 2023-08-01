import '../../domain/models/requests/create_team_request.dart';
import '../../domain/models/requests/user_auth_request.dart';
import '../../domain/models/responses/contest_response.dart';
import '../../domain/models/responses/create_team_response.dart';
import '../../domain/models/responses/matches_detail_response.dart';
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

  @override
  Future<DataState<ContestResponse>> contests() {
    return getStateOf<ContestResponse>(
        request: () => _skipperApiService.contests());
  }

  @override
  Future<DataState<MatchesDetailResponse>> matchesDetail() {
    return getStateOf<MatchesDetailResponse>(
        request: () => _skipperApiService.matchesDetail());
  }

  @override
  Future<DataState<CreateTeamResponse>> createTeam(
      {required CreateTeamRequest request}) {
    return getStateOf<CreateTeamResponse>(
        request: () => _skipperApiService.createTeam(request: request));
  }
}
