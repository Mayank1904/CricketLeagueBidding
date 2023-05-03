import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../utils/constants/strings.dart';

part 'skipper_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class SkipperApiService {
  factory SkipperApiService(Dio dio, {String baseUrl}) = _SkipperApiService;
}
