import 'dart:convert';

class Season {
  final String key;
  final String name;
  final String card_name;
  Season({
    required this.key,
    required this.name,
    required this.card_name,
  });

  Season copyWith({
    String? key,
    String? name,
    String? card_name,
  }) {
    return Season(
      key: key ?? this.key,
      name: name ?? this.name,
      card_name: card_name ?? this.card_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'name': name,
      'card_name': card_name,
    };
  }

  factory Season.fromMap(Map<String, dynamic> map) {
    return Season(
      key: map['key'] as String,
      name: map['name'] as String,
      card_name: map['card_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Season.fromJson(String source) => Season.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Season(key: $key, name: $name, card_name: $card_name)';

  @override
  bool operator ==(covariant Season other) {
    if (identical(this, other)) return true;
  
    return 
      other.key == key &&
      other.name == name &&
      other.card_name == card_name;
  }

  @override
  int get hashCode => key.hashCode ^ name.hashCode ^ card_name.hashCode;
}