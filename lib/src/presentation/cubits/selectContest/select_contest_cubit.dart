import 'package:equatable/equatable.dart';

import '../../../domain/models/responses/contest.dart';
import '../../../domain/models/responses/contest_response.dart';
import '../../../domain/respositories/skipper_api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../../../utils/validations/validations.dart';

import '../base_cubit.dart';

part 'select_contest_state.dart';

class SelectContestCubit extends BaseCubit<SelectContestState, ContestResponse>
    with ValidationMixin {
  final SkipperApiRepository _apiRepository;
  SelectContestCubit(this._apiRepository)
      : super(
          SelectContestInitial(),
          ContestResponse(),
        );

  void loadContestList() async {
    if (isBusy) return;
    emit(SelectContestLoading());

    await run(() async {
      final response = await _apiRepository.contests();

      if (response is DataSuccess) {
        emit(SelectContestLoaded(
          contestList: response.data?.data,
        ));
      } else if (response is DataFailed) {
        emit(SelectContestError(errorMessage: response.error?.message));
      }
    });
  }
}
