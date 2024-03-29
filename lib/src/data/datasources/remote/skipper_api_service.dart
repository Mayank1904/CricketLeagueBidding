import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/requests/create_team_request.dart';
import '../../../domain/models/requests/user_auth_request.dart';
import '../../../domain/models/responses/contest_response.dart';
import '../../../domain/models/responses/create_team_response.dart';
import '../../../domain/models/responses/matches_detail_response.dart';
import '../../../domain/models/responses/upcoming_matches_response.dart';
import '../../../domain/models/responses/user_auth_response.dart';
import '../../../utils/constants/strings.dart';

part 'skipper_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class SkipperApiService {
  factory SkipperApiService(Dio dio, {String baseUrl}) = _SkipperApiService;

  @POST('/auth/register')
  Future<HttpResponse<UserAuthResponse>> register({
    @Body() UserAuthRequest? request,
  });

  @POST('/auth/verify')
  Future<HttpResponse<UserAuthResponse>> verify({
    @Header('authorization') required String token,
    @Body() UserAuthRequest? request,
  });

  @POST('/auth/login_with_phone')
  Future<HttpResponse<UserAuthResponse>> loginWithPhone({
    @Body() UserAuthRequest? request,
  });

  @GET('/v1/master/recent-matches')
  Future<HttpResponse<UpcomingMatchesResponse>> upcomingMatches();

  @GET('/v1/contest')
  Future<HttpResponse<ContestResponse>> contests();

  @POST('/v1/create-team')
  Future<HttpResponse<CreateTeamResponse>> createTeam({
    @Body() CreateTeamRequest? request,
  });

  @GET('/v1/matches-detail')
  Future<HttpResponse<MatchesDetailResponse>> matchesDetail();
}
