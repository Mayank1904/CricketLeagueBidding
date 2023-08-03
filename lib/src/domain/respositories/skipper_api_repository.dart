import '../../utils/resources/data_state.dart';
import '../models/requests/create_team_request.dart';
import '../models/requests/user_auth_request.dart';
import '../models/responses/contest_response.dart';
import '../models/responses/create_team_response.dart';
import '../models/responses/matches_detail_response.dart';
import '../models/responses/upcoming_matches_response.dart';
import '../models/responses/user_auth_response.dart';

abstract class SkipperApiRepository {
  Future<DataState<UserAuthResponse>> doRegister({
    required UserAuthRequest request,
  });
  Future<DataState<UserAuthResponse>> verify(
      {required UserAuthRequest request, String? token});
  Future<DataState<UserAuthResponse>> loginWithPhone({
    required UserAuthRequest request,
  });
  Future<DataState<UpcomingMatchesResponse>> upcomingMatches();
  Future<DataState<ContestResponse>> contests();
  Future<DataState<MatchesDetailResponse>> matchesDetail();
  Future<DataState<CreateTeamResponse>> createTeam({
    required CreateTeamRequest request,
    required String? token,
  });
}
