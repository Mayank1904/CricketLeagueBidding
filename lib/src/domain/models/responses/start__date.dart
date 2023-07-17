import 'dart:convert';

class Start_date {
  final String iso;
  Start_date({
    required this.iso,
  });

  Start_date copyWith({
    String? iso,
  }) {
    return Start_date(
      iso: iso ?? this.iso,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso': iso,
    };
  }

  factory Start_date.fromMap(Map<String, dynamic> map) {
    return Start_date(
      iso: map['iso'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Start_date.fromJson(String source) => Start_date.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Start_date(iso: $iso)';

  @override
  bool operator ==(covariant Start_date other) {
    if (identical(this, other)) return true;
  
    return 
      other.iso == iso;
  }

  @override
  int get hashCode => iso.hashCode;
}