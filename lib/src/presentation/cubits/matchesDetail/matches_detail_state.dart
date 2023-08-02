part of 'matches_detail_cubit.dart';

abstract class MatchesDetailState extends Equatable {
  final String? errorMessage;
  final List<Player>? players;
  final Teams? teams;
  const MatchesDetailState({this.players, this.teams, this.errorMessage});

  @override
  List<Object> get props => [];
}

class MatchesDetailInitial extends MatchesDetailState {}

class MatchesDetailLoading extends MatchesDetailState {}

class MatchesDetailLoaded extends MatchesDetailState {
  const MatchesDetailLoaded({
    required super.players,
    required super.teams,
  });
}

class MatchesDetailError extends MatchesDetailState {
  const MatchesDetailError({required super.errorMessage});
}
