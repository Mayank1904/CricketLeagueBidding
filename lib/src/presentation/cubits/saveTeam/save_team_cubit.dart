import 'package:equatable/equatable.dart';

import '../../../domain/models/requests/create_team_request.dart';
import '../../../domain/models/responses/contest_response.dart';
import '../../../domain/respositories/skipper_api_repository.dart';
import '../../../utils/auth_service.dart';
import '../../../utils/resources/data_state.dart';
import '../../../utils/validations/validations.dart';

import '../../screens/widgets/save_team_datatable_widget.dart';
import '../base_cubit.dart';

part 'save_team_state.dart';

class SaveTeamCubit extends BaseCubit<SaveTeamState, ContestResponse>
    with ValidationMixin {
  SaveTeamCubit(this._apiRepository, this.authService)
      : super(SaveTeamInitial(), ContestResponse());

  final SkipperApiRepository _apiRepository;
  final AuthService authService;

  void createTeam(List<Player> list, String? matchCardKey) async {
    if (isBusy) return;
    emit(SaveTeamLoading());

    await run(() async {
      var isCaptainItem =
          list.firstWhere((element) => element.isCaptain == true);
      var isViceCaptainItem =
          list.firstWhere((element) => element.isViceCaptain == true);
      var otherItems = list
          .skipWhile((value) =>
              (value.isCaptain == true || value.isViceCaptain == true))
          .map((e) => MTeam(name: e.name ?? '', role: e.role ?? ''))
          .toList();
      ;
      var mTeamList = List<MTeam>.empty(growable: true);
      mTeamList.add(MTeam(
          name: isCaptainItem.name ?? '', role: isCaptainItem.role ?? ''));
      mTeamList.add(MTeam(
          name: isViceCaptainItem.name ?? '',
          role: isViceCaptainItem.role ?? ''));
      mTeamList.addAll(otherItems);
      var token = await authService.getToken();

      final response = await _apiRepository.createTeam(
        request: CreateTeamRequest(
          userDetailId: 1,
          matchCardKey: matchCardKey ?? '',
          mTeam: mTeamList,
        ),
        token: token,
      );

      if (response is DataSuccess) {
        emit(const SaveTeamLoaded());
      } else if (response is DataFailed) {
        emit(SaveTeamError(errorMessage: response.error?.message));
      }
    });
  }
}
