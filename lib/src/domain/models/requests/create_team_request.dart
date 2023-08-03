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
  final String name;
  final String role;
  const MTeam({
    required this.name,
    required this.role,
  });

  MTeam copyWith({
    String? name,
    String? role,
  }) {
    return MTeam(
      name: name ?? this.name,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'role': role,
    };
  }

  factory MTeam.fromMap(Map<String, dynamic> map) {
    return MTeam(
      name: (map['name'] ?? '') as String,
      role: (map['role'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MTeam.fromJson(String source) =>
      MTeam.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, role];
}
