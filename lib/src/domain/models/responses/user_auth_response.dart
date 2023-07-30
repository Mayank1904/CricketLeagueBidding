// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserAuthResponse extends Equatable {
  final String? apiResponse;
  const UserAuthResponse({
    this.apiResponse,
  });

  UserAuthResponse copyWith({
    String? apiResponse,
  }) {
    return UserAuthResponse(
      apiResponse: apiResponse ?? this.apiResponse,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'api_response': apiResponse,
    };
  }

  factory UserAuthResponse.fromMap(Map<String, dynamic> map) {
    return UserAuthResponse(
      apiResponse:
          map['api_response'] != null ? map['api_response'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAuthResponse.fromJson(String source) =>
      UserAuthResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [apiResponse ?? ''];
}
