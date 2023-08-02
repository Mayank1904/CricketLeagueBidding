import 'package:equatable/equatable.dart';

import '../../../domain/models/responses/matches_detail_response.dart';
import '../../../domain/respositories/skipper_api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../../../utils/validations/validations.dart';
import '../base_cubit.dart';

part 'matches_detail_state.dart';

class MatchesDetailCubit
    extends BaseCubit<MatchesDetailState, MatchesDetailResponse>
    with ValidationMixin {
  MatchesDetailCubit(this._apiRepository)
      : super(MatchesDetailInitial(), const MatchesDetailResponse());

  final SkipperApiRepository _apiRepository;

  void getMatchesDetails() async {
    // if (isBusy) return;
    emit(MatchesDetailLoading());

    await run(() async {
      final response = await _apiRepository.matchesDetail();

      if (response is DataSuccess) {
        emit(MatchesDetailLoaded(
          teams: response.data?.data?.teams,
          players: response.data?.data?.players,
        ));
      } else if (response is DataFailed) {
        emit(MatchesDetailError(errorMessage: response.error?.message));
      }
    });
  }
}
