import 'package:equatable/equatable.dart';

import '../../../domain/models/requests/create_team_request.dart';
import '../../../domain/models/responses/contest_response.dart';
import '../../../domain/respositories/skipper_api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../../../utils/validations/validations.dart';

import '../base_cubit.dart';

part 'save_team_state.dart';

class SaveTeamCubit extends BaseCubit<SaveTeamState, ContestResponse>
    with ValidationMixin {
  SaveTeamCubit(this._apiRepository)
      : super(SaveTeamInitial(), ContestResponse());

  final SkipperApiRepository _apiRepository;

  void createTeam(CreateTeamRequest request) async {
    if (isBusy) return;
    emit(SaveTeamLoading());

    await run(() async {
      final response = await _apiRepository.createTeam(request: request);

      if (response is DataSuccess) {
        emit(const SaveTeamLoaded());
      } else if (response is DataFailed) {
        emit(SaveTeamError(errorMessage: response.error?.message));
      }
    });
  }
}
