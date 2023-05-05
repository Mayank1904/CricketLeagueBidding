import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/requests/register_request.dart';
import '../../../domain/models/responses/register_response.dart';
import '../../../utils/constants/strings.dart';

part 'skipper_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.JsonSerializable)
abstract class SkipperApiService {
  factory SkipperApiService(Dio dio, {String baseUrl}) = _SkipperApiService;

  @POST('/auth/register')
  Future<HttpResponse<RegisterResponse>> register({
    @Body() RegisterRequest? request,
  });

  @POST('/auth/verify')
  Future<HttpResponse<RegisterResponse>> verify({
    @Body() RegisterRequest? request,
  });
}
