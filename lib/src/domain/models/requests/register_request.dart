// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  final String? apiBody;
  const RegisterRequest({
    this.apiBody,
  });

  RegisterRequest copyWith({
    String? apiBody,
  }) {
    return RegisterRequest(
      apiBody: apiBody ?? this.apiBody,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apiBody': apiBody,
    };
  }

  factory RegisterRequest.fromMap(Map<String, dynamic> map) {
    return RegisterRequest(
      apiBody: map['apiBody'] != null ? map['apiBody'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequest.fromJson(String source) =>
      RegisterRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [apiBody!];
}
