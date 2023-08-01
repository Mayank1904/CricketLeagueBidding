import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'matches_detail_state.dart';

class MatchesDetailCubit extends Cubit<MatchesDetailState> {
  MatchesDetailCubit() : super(MatchesDetailInitial());
}
