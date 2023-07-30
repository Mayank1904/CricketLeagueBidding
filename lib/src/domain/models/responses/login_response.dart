import 'dart:convert';

import 'api_response.dart';

class LoginResponse {
  final ApiResponse api_response;
  final String access_token;
  LoginResponse({
    required this.api_response,
    required this.access_token,
  });

  LoginResponse copyWith({
    ApiResponse? api_response,
    String? access_token,
  }) {
    return LoginResponse(
      api_response: api_response ?? this.api_response,
      access_token: access_token ?? this.access_token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'api_response': api_response.toMap(),
      'access_token': access_token,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      api_response:
          ApiResponse.fromMap(map['api_response'] as Map<String, dynamic>),
      access_token: map['access_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginResponse(api_response: $api_response, access_token: $access_token)';

  @override
  bool operator ==(covariant LoginResponse other) {
    if (identical(this, other)) return true;

    return other.api_response == api_response &&
        other.access_token == access_token;
  }

  @override
  int get hashCode => api_response.hashCode ^ access_token.hashCode;
}
