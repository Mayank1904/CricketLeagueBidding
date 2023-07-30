// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserAuthRequest extends Equatable {
  final String? apiBody;
  const UserAuthRequest({
    this.apiBody,
  });

  UserAuthRequest copyWith({
    String? apiBody,
  }) {
    return UserAuthRequest(
      apiBody: apiBody ?? this.apiBody,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'api_body': apiBody,
    };
  }

  factory UserAuthRequest.fromMap(Map<String, dynamic> map) {
    return UserAuthRequest(
      apiBody: map['apiBody'] != null ? map['apiBody'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAuthRequest.fromJson(String source) =>
      UserAuthRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [apiBody!];
}
