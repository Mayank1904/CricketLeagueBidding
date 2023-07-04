import 'dart:convert';

import 'package:equatable/equatable.dart';

class CreateTeamResponse extends Equatable {
  final String status;
  const CreateTeamResponse({
    required this.status,
  });

  CreateTeamResponse copyWith({
    String? status,
  }) {
    return CreateTeamResponse(
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
    };
  }

  factory CreateTeamResponse.fromMap(Map<String, dynamic> map) {
    return CreateTeamResponse(
      status: (map['status'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateTeamResponse.fromJson(String source) =>
      CreateTeamResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status];
}
