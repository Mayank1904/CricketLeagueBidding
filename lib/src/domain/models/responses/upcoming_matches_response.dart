import 'dart:convert';

import 'data.dart';

class UpcomingMatchesResponse {
  final Data data;
  final String token;
  UpcomingMatchesResponse({
    required this.data,
    required this.token,
  });

  UpcomingMatchesResponse copyWith({
    Data? data,
    String? token,
  }) {
    return UpcomingMatchesResponse(
      data: data ?? this.data,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
      'token': token,
    };
  }

  factory UpcomingMatchesResponse.fromMap(Map<String, dynamic> map) {
    return UpcomingMatchesResponse(
      data: Data.fromMap(map['data'] as Map<String, dynamic>),
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpcomingMatchesResponse.fromJson(String source) =>
      UpcomingMatchesResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UpcomingMatchesResponse(data: $data, token: $token)';

  @override
  bool operator ==(covariant UpcomingMatchesResponse other) {
    if (identical(this, other)) return true;

    return other.data == data && other.token == token;
  }

  @override
  int get hashCode => data.hashCode ^ token.hashCode;
}
