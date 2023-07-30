import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'data.dart' as d;

class Data extends Equatable {
  final bool status;
  final String version;
  final int status_code;
  final String expires;
  final String Etag;
  final String cache_key;
  final d.Data data;
  const Data({
    required this.status,
    required this.version,
    required this.status_code,
    required this.expires,
    required this.Etag,
    required this.cache_key,
    required this.data,
  });

  Data copyWith({
    bool? status,
    String? version,
    int? status_code,
    String? expires,
    String? Etag,
    String? cache_key,
    d.Data? data,
  }) {
    return Data(
      status: status ?? this.status,
      version: version ?? this.version,
      status_code: status_code ?? this.status_code,
      expires: expires ?? this.expires,
      Etag: Etag ?? this.Etag,
      cache_key: cache_key ?? this.cache_key,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'version': version,
      'status_code': status_code,
      'expires': expires,
      'Etag': Etag,
      'cache_key': cache_key,
      'data': data.toMap(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      status: (map['status'] ?? false) as bool,
      version: (map['version'] ?? '') as String,
      status_code: (map['status_code'].toInt() ?? 0) as int,
      expires: (map['expires'] ?? '') as String,
      Etag: (map['Etag'] ?? '') as String,
      cache_key: (map['cache_key'] ?? '') as String,
      data: d.Data.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      status,
      version,
      status_code,
      expires,
      Etag,
      cache_key,
      data,
    ];
  }
}
