import '../../domain/models/requests/register_request.dart';
import '../../domain/models/responses/register_response.dart';
import '../../domain/respositories/skipper_api_repository.dart';
import '../../utils/resources/data_state.dart';
import '../datasources/remote/skipper_api_service.dart';
import 'base/base_api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository
    implements SkipperApiRepository {
  final SkipperApiService _skipperApiService;

  ApiRepositoryImpl(this._skipperApiService);

  @override
  Future<DataState<RegisterResponse>> doRegister(
      {required RegisterRequest request}) {
    return getStateOf<RegisterResponse>(
        request: () => _skipperApiService.register(request: request));
  }

  @override
  Future<DataState<RegisterResponse>> verify(
      {required RegisterRequest request}) {
    return getStateOf<RegisterResponse>(
        request: () => _skipperApiService.verify(request: request));
  }
}
