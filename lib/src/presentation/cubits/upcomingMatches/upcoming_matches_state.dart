part of 'upcoming_matches_cubit.dart';

abstract class UpcomingMatchesState extends Equatable {
  final String? errorMessage;
  final List<Cards>? upcomingMatchesList;

  const UpcomingMatchesState({this.upcomingMatchesList, this.errorMessage});

  @override
  List<Object?> get props => [errorMessage, upcomingMatchesList];
}

class UpcomingMatchesInitial extends UpcomingMatchesState {}

class UpcomingMatchesLoading extends UpcomingMatchesState {}

class UpcomingMatchesLoaded extends UpcomingMatchesState {
  const UpcomingMatchesLoaded({required super.upcomingMatchesList});
}

class UpcomingMatchesError extends UpcomingMatchesState {
  const UpcomingMatchesError({required super.errorMessage});
}
