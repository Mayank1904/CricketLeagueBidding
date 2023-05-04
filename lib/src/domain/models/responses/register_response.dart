// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  final String? apiResponse;
  const RegisterResponse({
    this.apiResponse,
  });

  RegisterResponse copyWith({
    String? apiResponse,
  }) {
    return RegisterResponse(
      apiResponse: apiResponse ?? this.apiResponse,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apiResponse': apiResponse,
    };
  }

  factory RegisterResponse.fromMap(Map<String, dynamic> map) {
    return RegisterResponse(
      apiResponse:
          map['apiResponse'] != null ? map['apiResponse'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponse.fromJson(String source) =>
      RegisterResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [apiResponse ?? ''];
}
