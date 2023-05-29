import 'dart:convert';

import 'a.dart';
import 'b.dart';

class Teams {
  final A a;
  final B b;
  Teams({
    required this.a,
    required this.b,
  });

  Teams copyWith({
    A? a,
    B? b,
  }) {
    return Teams(
      a: a ?? this.a,
      b: b ?? this.b,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'a': a.toMap(),
      'b': b.toMap(),
    };
  }

  factory Teams.fromMap(Map<String, dynamic> map) {
    return Teams(
      a: A.fromMap(map['a'] as Map<String,dynamic>),
      b: B.fromMap(map['b'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Teams.fromJson(String source) => Teams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Teams(a: $a, b: $b)';

  @override
  bool operator ==(covariant Teams other) {
    if (identical(this, other)) return true;
  
    return 
      other.a == a &&
      other.b == b;
  }

  @override
  int get hashCode => a.hashCode ^ b.hashCode;
}