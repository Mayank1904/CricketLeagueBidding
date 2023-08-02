import 'dart:convert';

import 'package:equatable/equatable.dart';

class MatchesDetailResponse extends Equatable {
  final Data? data;
  final String? token;
  const MatchesDetailResponse({
    this.data,
    this.token,
  });

  MatchesDetailResponse copyWith({
    Data? data,
    String? token,
  }) {
    return MatchesDetailResponse(
      data: data ?? this.data,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data?.toMap(),
      'token': token,
    };
  }

  factory MatchesDetailResponse.fromMap(Map<String, dynamic> map) {
    return MatchesDetailResponse(
      data: Data.fromMap(map['data'] as Map<String, dynamic>),
      token: (map['token'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MatchesDetailResponse.fromJson(String source) =>
      MatchesDetailResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data, token];
}

class Data extends Equatable {
  final List<Player> players;
  final Teams teams;
  const Data({
    required this.players,
    required this.teams,
  });

  Data copyWith({
    List<Player>? players,
    Teams? teams,
  }) {
    return Data(
      players: players ?? this.players,
      teams: teams ?? this.teams,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'players': players.map((x) => x.toMap()).toList(),
      'teams': teams.toMap(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      players: List<Player>.from(
        (map['players'] as List<dynamic>).map<Player>(
          (x) => Player.fromMap(x as Map<String, dynamic>),
        ),
      ),
      teams: Teams.fromMap(map['teams'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [players, teams];
}

class Player extends Equatable {
  final String? fullname;
  final Identified_roles? identified_roles;
  final String? key;
  final String? name;
  final String? gender;
  final String? seasonal_role;
  final String? team_key;
  final String? nationality;
  final String? date_of_birth;
  final String? card_name;
  final bool? isPlaying;
  final int? credit_value;
  final double? score;
  final String? selectedByPercentage;
  const Player({
    this.fullname,
    this.identified_roles,
    this.key,
    this.name,
    this.gender,
    this.seasonal_role,
    this.team_key,
    this.nationality,
    this.date_of_birth,
    this.card_name,
    this.isPlaying,
    this.credit_value,
    this.score,
    this.selectedByPercentage,
  });

  Player copyWith({
    String? fullname,
    Identified_roles? identified_roles,
    String? key,
    String? name,
    String? gender,
    String? seasonal_role,
    String? team_key,
    String? nationality,
    String? date_of_birth,
    String? card_name,
    bool? isPlaying,
    int? credit_value,
    double? score,
    String? selectedByPercentage,
  }) {
    return Player(
      fullname: fullname ?? this.fullname,
      identified_roles: identified_roles ?? this.identified_roles,
      key: key ?? this.key,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      seasonal_role: seasonal_role ?? this.seasonal_role,
      team_key: team_key ?? this.team_key,
      nationality: nationality ?? this.nationality,
      date_of_birth: date_of_birth ?? this.date_of_birth,
      card_name: card_name ?? this.card_name,
      isPlaying: isPlaying ?? this.isPlaying,
      credit_value: credit_value ?? this.credit_value,
      score: score ?? this.score,
      selectedByPercentage: selectedByPercentage ?? this.selectedByPercentage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'identified_roles': identified_roles?.toMap(),
      'key': key,
      'name': name,
      'gender': gender,
      'seasonal_role': seasonal_role,
      'team_key': team_key,
      'nationality': nationality,
      'date_of_birth': date_of_birth,
      'card_name': card_name,
      'isPlaying': isPlaying,
      'credit_value': credit_value,
      'score': score,
      'selectedByPercentage': selectedByPercentage,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      fullname: (map['fullname'] ?? '') as String,
      identified_roles: Identified_roles.fromMap(
          map['identified_roles'] as Map<String, dynamic>),
      key: (map['key'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      gender: (map['gender'] ?? '') as String,
      seasonal_role: (map['seasonal_role'] ?? '') as String,
      team_key: (map['team_key'] ?? '') as String,
      nationality: (map['nationality'] ?? '') as String,
      date_of_birth: (map['date_of_birth'] ?? '') as String,
      card_name: (map['card_name'] ?? '') as String,
      isPlaying: (map['isPlaying'] ?? false) as bool,
      credit_value: (map['credit_value'].toInt() ?? 0) as int,
      score: (double.tryParse(map["score"].toString()) ?? 0.0),
      selectedByPercentage: (map['selectedByPercentage'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Player.fromJson(String source) =>
      Player.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      fullname,
      identified_roles,
      key,
      name,
      gender,
      seasonal_role,
      team_key,
      nationality,
      date_of_birth,
      card_name,
      isPlaying,
      credit_value,
      score,
      selectedByPercentage,
    ];
  }
}

class Identified_roles extends Equatable {
  final bool batsman;
  final bool bowler;
  final bool keeper;
  const Identified_roles({
    required this.batsman,
    required this.bowler,
    required this.keeper,
  });

  Identified_roles copyWith({
    bool? batsman,
    bool? bowler,
    bool? keeper,
  }) {
    return Identified_roles(
      batsman: batsman ?? this.batsman,
      bowler: bowler ?? this.bowler,
      keeper: keeper ?? this.keeper,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'batsman': batsman,
      'bowler': bowler,
      'keeper': keeper,
    };
  }

  factory Identified_roles.fromMap(Map<String, dynamic> map) {
    return Identified_roles(
      batsman: (map['batsman'] ?? false) as bool,
      bowler: (map['bowler'] ?? false) as bool,
      keeper: (map['keeper'] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Identified_roles.fromJson(String source) =>
      Identified_roles.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [batsman, bowler, keeper];
}

class Teams extends Equatable {
  final A a;
  final B b;
  const Teams({
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
      a: A.fromMap(map['a'] as Map<String, dynamic>),
      b: B.fromMap(map['b'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Teams.fromJson(String source) =>
      Teams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [a, b];
}

class A extends Equatable {
  final String key;
  final String name;
  final String short_name;
  const A({
    required this.key,
    required this.name,
    required this.short_name,
  });

  A copyWith({
    String? key,
    String? name,
    String? short_name,
  }) {
    return A(
      key: key ?? this.key,
      name: name ?? this.name,
      short_name: short_name ?? this.short_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'name': name,
      'short_name': short_name,
    };
  }

  factory A.fromMap(Map<String, dynamic> map) {
    return A(
      key: (map['key'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      short_name: (map['short_name'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory A.fromJson(String source) =>
      A.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [key, name, short_name];
}

class B extends Equatable {
  final String key;
  final String name;
  final String short_name;
  const B({
    required this.key,
    required this.name,
    required this.short_name,
  });

  B copyWith({
    String? key,
    String? name,
    String? short_name,
  }) {
    return B(
      key: key ?? this.key,
      name: name ?? this.name,
      short_name: short_name ?? this.short_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'name': name,
      'short_name': short_name,
    };
  }

  factory B.fromMap(Map<String, dynamic> map) {
    return B(
      key: (map['key'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      short_name: (map['short_name'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory B.fromJson(String source) =>
      B.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [key, name, short_name];
}
