import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'contest.dart';

class ContestResponse {
  final List<Contest>? data;
  ContestResponse({
    this.data,
  });

  ContestResponse copyWith({
    List<Contest>? data,
  }) {
    return ContestResponse(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data!.map((x) => x.toMap()).toList(),
    };
  }

  factory ContestResponse.fromMap(Map<String, dynamic> map) {
    return ContestResponse(
      data: List<Contest>.from(
        (map['data'] as List<dynamic>).map<Contest>(
          (x) => Contest.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContestResponse.fromJson(String source) =>
      ContestResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ContestResponse(data: $data)';

  @override
  bool operator ==(covariant ContestResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
