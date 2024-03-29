import 'dart:convert';

import 'package:equatable/equatable.dart';

class CreateTeamRequest extends Equatable {
  final int userDetailId;
  final String matchCardKey;
  final List<MTeam> mTeam;
  const CreateTeamRequest({
    required this.userDetailId,
    required this.matchCardKey,
    required this.mTeam,
  });

  CreateTeamRequest copyWith({
    int? userDetailId,
    String? matchCardKey,
    List<MTeam>? mTeam,
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
      'mTeam': mTeam.map((x) => x.toMap()).toList(),
    };
  }

  factory CreateTeamRequest.fromMap(Map<String, dynamic> map) {
    return CreateTeamRequest(
      userDetailId: (map['userDetailId'].toInt() ?? 0) as int,
      matchCardKey: (map['matchCardKey'] ?? '') as String,
      mTeam: List<MTeam>.from(
        (map['mTeam'] as List<int>).map<MTeam>(
          (x) => MTeam.fromMap(x as Map<String, dynamic>),
        ),
      ),
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

class MTeam extends Equatable {
  final String Name;
  final String Role;
  const MTeam({
    required this.Name,
    required this.Role,
  });

  MTeam copyWith({
    String? Name,
    String? Role,
  }) {
    return MTeam(
      Name: Name ?? this.Name,
      Role: Role ?? this.Role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Name': Name,
      'Role': Role,
    };
  }

  factory MTeam.fromMap(Map<String, dynamic> map) {
    return MTeam(
      Name: (map['Name'] ?? '') as String,
      Role: (map['Role'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MTeam.fromJson(String source) =>
      MTeam.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [Name, Role];
}
