import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/requests/user_auth_request.dart';
import '../../../domain/models/responses/data.dart';
import '../../../domain/models/responses/upcoming_matches_response.dart';
import '../../../domain/models/responses/user_auth_response.dart';
import '../../../presentation/screens/widgets/upcoming_match_tile.dart';
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
}
