part of 'save_team_cubit.dart';

abstract class SaveTeamState extends Equatable {
  final String? errorMessage;

  const SaveTeamState({this.errorMessage});

  @override
  List<Object> get props => [];
}

class SaveTeamInitial extends SaveTeamState {}

class SaveTeamLoading extends SaveTeamState {}

class SaveTeamLoaded extends SaveTeamState {
  const SaveTeamLoaded();
}

class SaveTeamError extends SaveTeamState {
  const SaveTeamError({required super.errorMessage});
}
