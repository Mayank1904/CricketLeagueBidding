import 'dart:convert';

import 'match.dart';

class A {
  final String key;
  final String name;
  final String shortName;
  final String country;
  final Match match;
  A({
    required this.key,
    required this.name,
    required this.shortName,
    required this.country,
    required this.match,
  });

  A copyWith({
    String? key,
    String? name,
    String? shortName,
    String? country,
    Match? match,
  }) {
    return A(
      key: key ?? this.key,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      country: country ?? this.country,
      match: match ?? this.match,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'name': name,
      'shortName': shortName,
      'country': country,
      'match': match.toMap(),
    };
  }

  factory A.fromMap(Map<String, dynamic> map) {
    return A(
      key: map['key'] as String,
      name: map['name'] as String,
      shortName: map['short_name'] as String,
      country: map['country'] as String,
      match: Match.fromMap(map['match'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory A.fromJson(String source) =>
      A.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'A(key: $key, name: $name, shortName: $shortName, country: $country, match: $match)';
  }

  @override
  bool operator ==(covariant A other) {
    if (identical(this, other)) return true;

    return other.key == key &&
        other.name == name &&
        other.shortName == shortName &&
        other.country == country &&
        other.match == match;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        name.hashCode ^
        shortName.hashCode ^
        country.hashCode ^
        match.hashCode;
  }
}
