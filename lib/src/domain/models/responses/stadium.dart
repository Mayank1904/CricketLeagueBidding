import 'dart:convert';

class Stadium {
  final String key;
  final String name;
  final String city;
  final String country;
  Stadium({
    required this.key,
    required this.name,
    required this.city,
    required this.country,
  });

  Stadium copyWith({
    String? key,
    String? name,
    String? city,
    String? country,
  }) {
    return Stadium(
      key: key ?? this.key,
      name: name ?? this.name,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'name': name,
      'city': city,
      'country': country,
    };
  }

  factory Stadium.fromMap(Map<String, dynamic> map) {
    return Stadium(
      key: map['key'] as String,
      name: map['name'] as String,
      city: map['city'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Stadium.fromJson(String source) => Stadium.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Stadium(key: $key, name: $name, city: $city, country: $country)';
  }

  @override
  bool operator ==(covariant Stadium other) {
    if (identical(this, other)) return true;
  
    return 
      other.key == key &&
      other.name == name &&
      other.city == city &&
      other.country == country;
  }

  @override
  int get hashCode {
    return key.hashCode ^
      name.hashCode ^
      city.hashCode ^
      country.hashCode;
  }
}