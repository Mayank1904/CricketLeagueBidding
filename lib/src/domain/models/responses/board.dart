import 'dart:convert';

class Board {
  final String key;
  final String name;
  final String code;
  final String country;

  Board({
    required this.key,
    required this.name,
    required this.code,
    required this.country,
  });

  Board copyWith({
    String? key,
    String? name,
    String? code,
    String? country,
  }) {
    return Board(
      key: key ?? this.key,
      name: name ?? this.name,
      code: code ?? this.code,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'name': name,
      'code': code,
      'country': country,
      'parent': null,
    };
  }

  factory Board.fromMap(Map<String, dynamic> map) {
    return Board(
      key: map['key'] as String,
      name: map['name'] as String,
      code: map['code'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Board.fromJson(String source) =>
      Board.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Board(key: $key, name: $name, code: $code, country: $country)';
  }

  @override
  bool operator ==(covariant Board other) {
    if (identical(this, other)) return true;

    return other.key == key &&
        other.name == name &&
        other.code == code &&
        other.country == country;
  }

  @override
  int get hashCode {
    return key.hashCode ^ name.hashCode ^ code.hashCode ^ country.hashCode;
  }
}
