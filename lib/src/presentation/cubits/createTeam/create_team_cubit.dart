import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_team_state.dart';

class CreateTeamCubit extends Cubit<CreateTeamState> {
  CreateTeamCubit() : super(CreateTeamInitial());
}
