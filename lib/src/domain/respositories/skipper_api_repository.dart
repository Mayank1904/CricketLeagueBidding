import '../../utils/resources/data_state.dart';
import '../models/requests/register_request.dart';
import '../models/responses/register_response.dart';

abstract class SkipperApiRepository {
  Future<DataState<RegisterResponse>> doRegister({
    required RegisterRequest request,
  });
  Future<DataState<RegisterResponse>> verify({
    required RegisterRequest request,
  });
}
