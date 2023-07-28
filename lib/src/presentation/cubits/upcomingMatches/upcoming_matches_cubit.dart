import 'package:equatable/equatable.dart';
import '../../../domain/models/responses/card.dart';
import '../../../domain/models/responses/data.dart';
import '../../../domain/respositories/skipper_api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../../../utils/validations/validations.dart';

import '../base_cubit.dart';

part 'upcoming_matches_state.dart';

class UpcomingMatchesCubit extends BaseCubit<UpcomingMatchesState, Data>
    with ValidationMixin {
  final SkipperApiRepository _apiRepository;

  UpcomingMatchesCubit(this._apiRepository)
      : super(
          UpcomingMatchesInitial(),
          Data(),
        );

  void loadUpcomingMatchesList() async {
    if (isBusy) return;
    emit(UpcomingMatchesLoading());

    await run(() async {
      final response = await _apiRepository.upcomingMatches();

      if (response is DataSuccess) {
        emit(UpcomingMatchesLoaded(
          upcomingMatchesList: response.data?.data.data.cards,
        ));
      } else if (response is DataFailed) {
        emit(UpcomingMatchesError(errorMessage: response.error?.message));
      }
    });
  }
}
