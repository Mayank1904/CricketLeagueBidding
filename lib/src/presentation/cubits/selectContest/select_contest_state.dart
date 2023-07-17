part of 'select_contest_cubit.dart';

abstract class SelectContestState extends Equatable {
  final String? errorMessage;
  final List<Contest>? contestList;
  const SelectContestState({this.contestList, this.errorMessage});

  @override
  List<Object?> get props => [errorMessage, contestList];
}

class SelectContestInitial extends SelectContestState {}

class SelectContestLoading extends SelectContestState {}

class SelectContestLoaded extends SelectContestState {
  const SelectContestLoaded({required super.contestList});
}

class SelectContestError extends SelectContestState {
  const SelectContestError({required super.errorMessage});
}
