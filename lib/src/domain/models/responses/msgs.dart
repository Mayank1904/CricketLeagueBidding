import 'dart:convert';

import 'package:flutter/foundation.dart';

class Msgs {
  final String? result;
  final List<dynamic> others;
  final String? info;
  final String? completed;
  Msgs({
    required this.result,
    required this.others,
    required this.info,
    required this.completed,
  });

  Msgs copyWith({
    String? result,
    List<dynamic>? others,
    String? info,
    String? completed,
  }) {
    return Msgs(
      result: result ?? this.result,
      others: others ?? this.others,
      info: info ?? this.info,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'result': result,
      'others': others,
      'info': info,
      'completed': completed,
    }..removeWhere(
        (dynamic key, dynamic value) => key == null || value == null);
  }

  factory Msgs.fromMap(Map<String, dynamic> map) {
    return Msgs(
      result: null,
      others: List<dynamic>.from((map['others'] as List<dynamic>)),
      info: map.containsKey('info') ? map['info'] as String : null,
      completed:
          map.containsKey('completed') ? map['completed'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Msgs.fromJson(String source) =>
      Msgs.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Msgs(result: $result, others: $others, info: $info, completed: $completed)';
  }

  @override
  bool operator ==(covariant Msgs other) {
    if (identical(this, other)) return true;

    return other.result == result &&
        listEquals(other.others, others) &&
        other.info == info &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return result.hashCode ^
        others.hashCode ^
        info.hashCode ^
        completed.hashCode;
  }
}
