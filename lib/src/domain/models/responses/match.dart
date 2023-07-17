import 'dart:convert';

class Match {
  final String season_team_key;
  Match({
    required this.season_team_key,
  });

  Match copyWith({
    String? season_team_key,
  }) {
    return Match(
      season_team_key: season_team_key ?? this.season_team_key,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'season_team_key': season_team_key,
    };
  }

  factory Match.fromMap(Map<String, dynamic> map) {
    return Match(
      season_team_key: map['season_team_key'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Match.fromJson(String source) => Match.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Match(season_team_key: $season_team_key)';

  @override
  bool operator ==(covariant Match other) {
    if (identical(this, other)) return true;
  
    return 
      other.season_team_key == season_team_key;
  }

  @override
  int get hashCode => season_team_key.hashCode;
}