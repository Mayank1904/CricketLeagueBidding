// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserRequest extends Equatable {
  final String? mobileNo;
  final String? countryCode;
  final String? source;
  final String? otp;
  const UserRequest({
    this.mobileNo,
    this.countryCode,
    this.source,
    this.otp,
  });

  UserRequest copyWith({
    String? mobileNo,
    String? countryCode,
    String? source,
    String? otp,
  }) {
    return UserRequest(
      mobileNo: mobileNo ?? this.mobileNo,
      countryCode: countryCode ?? this.countryCode,
      source: source ?? this.source,
      otp: otp ?? this.otp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mobileNo': mobileNo,
      'countryCode': countryCode,
      'source': source,
      'otp': otp,
    };
  }

  factory UserRequest.fromMap(Map<String, dynamic> map) {
    return UserRequest(
      mobileNo: map['mobileNo'] != null ? map['mobileNo'] as String : null,
      countryCode:
          map['countryCode'] != null ? map['countryCode'] as String : null,
      source: map['source'] != null ? map['source'] as String : null,
      otp: map['otp'] != null ? map['otp'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRequest.fromJson(String source) =>
      UserRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [mobileNo, countryCode, source, otp];
}
