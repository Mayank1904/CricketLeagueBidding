// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserResponse {
  final String? message;
  final String? status;
  final String? accessToken;
  UserResponse({
    this.message,
    this.status,
    this.accessToken,
  });

  UserResponse copyWith({
    String? message,
    String? status,
    String? accessToken,
  }) {
    return UserResponse(
      message: message ?? this.message,
      status: status ?? this.status,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
      'accessToken': accessToken,
    };
  }

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      message: map['message'] != null ? map['message'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      accessToken:
          map['accessToken'] != null ? map['accessToken'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) =>
      UserResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserAuthentication(message: $message, status: $status, accessToken: $accessToken)';

  @override
  bool operator ==(covariant UserResponse other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode => message.hashCode ^ status.hashCode ^ accessToken.hashCode;
}
