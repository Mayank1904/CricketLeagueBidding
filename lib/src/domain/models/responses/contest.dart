import 'dart:convert';

class Contest {
  final int enteryfee;
  final int firstprize;
  final int wining_percentage;
  final bool is_guaranteed;
  final String prizepool;
  final int totalspots;
  final int spotsleft;
  Contest({
    required this.enteryfee,
    required this.firstprize,
    required this.wining_percentage,
    required this.is_guaranteed,
    required this.prizepool,
    required this.totalspots,
    required this.spotsleft,
  });

  Contest copyWith({
    int? enteryfee,
    int? firstprize,
    int? wining_percentage,
    bool? is_guaranteed,
    String? prizepool,
    int? totalspots,
    int? spotsleft,
  }) {
    return Contest(
      enteryfee: enteryfee ?? this.enteryfee,
      firstprize: firstprize ?? this.firstprize,
      wining_percentage: wining_percentage ?? this.wining_percentage,
      is_guaranteed: is_guaranteed ?? this.is_guaranteed,
      prizepool: prizepool ?? this.prizepool,
      totalspots: totalspots ?? this.totalspots,
      spotsleft: spotsleft ?? this.spotsleft,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'enteryfee': enteryfee,
      'firstprize': firstprize,
      'wining_percentage': wining_percentage,
      'is_guaranteed': is_guaranteed,
      'prizepool': prizepool,
      'totalspots': totalspots,
      'spotsleft': spotsleft,
    };
  }

  factory Contest.fromMap(Map<String, dynamic> map) {
    return Contest(
      enteryfee: (map['enteryfee'].toInt() ?? 0) as int,
      firstprize: (map['firstprize'].toInt() ?? 0) as int,
      wining_percentage: (map['wining_percentage'].toInt() ?? 0) as int,
      is_guaranteed: (map['is_guaranteed'] ?? false) as bool,
      prizepool: (map['prizepool'] ?? '') as String,
      totalspots: (map['totalspots'].toInt() ?? 0) as int,
      spotsleft: (map['spotsleft'].toInt() ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contest.fromJson(String source) =>
      Contest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Contest(enteryfee: $enteryfee, firstprize: $firstprize, wining_percentage: $wining_percentage, is_guaranteed: $is_guaranteed, prizepool: $prizepool, totalspots: $totalspots, spotsleft: $spotsleft)';
  }

  @override
  bool operator ==(covariant Contest other) {
    if (identical(this, other)) return true;

    return other.enteryfee == enteryfee &&
        other.firstprize == firstprize &&
        other.wining_percentage == wining_percentage &&
        other.is_guaranteed == is_guaranteed &&
        other.prizepool == prizepool &&
        other.totalspots == totalspots &&
        other.spotsleft == spotsleft;
  }

  @override
  int get hashCode {
    return enteryfee.hashCode ^
        firstprize.hashCode ^
        wining_percentage.hashCode ^
        is_guaranteed.hashCode ^
        prizepool.hashCode ^
        totalspots.hashCode ^
        spotsleft.hashCode;
  }
}
