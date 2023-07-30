import 'dart:convert';

import 'package:equatable/equatable.dart';

class CreateTeamRequest extends Equatable {
  final int userDetailId;
  final String matchCardKey;
  final List<String> mTeam;
  const CreateTeamRequest({
    required this.userDetailId,
    required this.matchCardKey,
    required this.mTeam,
  });

  CreateTeamRequest copyWith({
    int? userDetailId,
    String? matchCardKey,
    List<String>? mTeam,
  }) {
    return CreateTeamRequest(
      userDetailId: userDetailId ?? this.userDetailId,
      matchCardKey: matchCardKey ?? this.matchCardKey,
      mTeam: mTeam ?? this.mTeam,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userDetailId': userDetailId,
      'matchCardKey': matchCardKey,
      'mTeam': mTeam,
    };
  }

  factory CreateTeamRequest.fromMap(Map<String, dynamic> map) {
    return CreateTeamRequest(
      userDetailId: (map['userDetailId'].toInt() ?? 0) as int,
      matchCardKey: (map['matchCardKey'] ?? '') as String,
      mTeam:
          List<String>.from((map['mTeam'] ?? const <String>[]) as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateTeamRequest.fromJson(String source) =>
      CreateTeamRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [userDetailId, matchCardKey, mTeam];
}
