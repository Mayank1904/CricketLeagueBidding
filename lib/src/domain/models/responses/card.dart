import 'dart:convert';

import 'board.dart';
import 'msgs.dart';
import 'season.dart';
import 'stadium.dart';
import 'start__date.dart';
import 'teams.dart';

class Cards {
  final String key;
  final String name;
  final String shortName;
  final String relatedName;
  final String title;
  final Season season;
  final Teams teams;
  final Msgs msgs;
  final Start_date startDate;
  final String format;
  final String venue;
  final String status;
  final String? winnerTeam;
  final String ref;
  final String expires;
  final int? approxCompletedTs;
  final String cacheKey;
  final Stadium stadium;
  final String gender;
  final Board board;
  Cards({
    required this.key,
    required this.name,
    required this.shortName,
    required this.relatedName,
    required this.title,
    required this.season,
    required this.teams,
    required this.msgs,
    required this.startDate,
    required this.format,
    required this.venue,
    required this.status,
    required this.winnerTeam,
    required this.ref,
    required this.expires,
    required this.approxCompletedTs,
    required this.cacheKey,
    required this.stadium,
    required this.gender,
    required this.board,
  });

  Cards copyWith({
    String? key,
    String? name,
    String? shortName,
    String? relatedName,
    String? title,
    Season? season,
    Teams? teams,
    Msgs? msgs,
    Start_date? startDate,
    String? format,
    String? venue,
    String? status,
    String? winnerTeam,
    String? ref,
    String? expires,
    int? approxCompletedTs,
    String? cacheKey,
    Stadium? stadium,
    String? gender,
    Board? board,
  }) {
    return Cards(
      key: key ?? this.key,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      relatedName: relatedName ?? this.relatedName,
      title: title ?? this.title,
      season: season ?? this.season,
      teams: teams ?? this.teams,
      msgs: msgs ?? this.msgs,
      startDate: startDate ?? this.startDate,
      format: format ?? this.format,
      venue: venue ?? this.venue,
      status: status ?? this.status,
      winnerTeam: winnerTeam ?? this.winnerTeam,
      ref: ref ?? this.ref,
      expires: expires ?? this.expires,
      approxCompletedTs: approxCompletedTs ?? this.approxCompletedTs,
      cacheKey: cacheKey ?? this.cacheKey,
      stadium: stadium ?? this.stadium,
      gender: gender ?? this.gender,
      board: board ?? this.board,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'name': name,
      'shortName': shortName,
      'relatedName': relatedName,
      'title': title,
      'season': season.toMap(),
      'teams': teams.toMap(),
      'msgs': msgs.toMap(),
      'startDate': startDate.toMap(),
      'format': format,
      'venue': venue,
      'status': status,
      'winnerTeam': winnerTeam,
      'ref': ref,
      'expires': expires,
      'approxCompletedTs': approxCompletedTs,
      'cacheKey': cacheKey,
      'stadium': stadium.toMap(),
      'gender': gender,
      'board': board.toMap(),
    };
  }

  factory Cards.fromMap(Map<String, dynamic> map) {
    return Cards(
      key: map['key'] as String,
      name: map['name'] as String,
      shortName: map['short_name'] as String,
      relatedName: map['related_name'] as String,
      title: map['title'] as String,
      season: Season.fromMap(map['season'] as Map<String, dynamic>),
      teams: Teams.fromMap(map['teams'] as Map<String, dynamic>),
      msgs: Msgs.fromMap(map['msgs'] as Map<String, dynamic>),
      startDate: Start_date.fromMap(map['start_date'] as Map<String, dynamic>),
      format: map['format'] as String,
      venue: map['venue'] as String,
      status: map['status'] as String,
      winnerTeam:
          map['winner_team'] != null ? map['winner_team'] as String : null,
      ref: map['ref'] as String,
      expires: map['expires'] as String,
      approxCompletedTs: map.containsKey('approx_completed_ts')
          ? map['approx_completed_ts'].toInt() as int
          : null,
      cacheKey: map['cache_key'] as String,
      stadium: Stadium.fromMap(map['stadium'] as Map<String, dynamic>),
      gender: map['gender'] as String,
      board: Board.fromMap(map['board'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cards.fromJson(String source) =>
      Cards.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cards(key: $key, name: $name, shortName: $shortName, relatedName: $relatedName, title: $title, season: $season, teams: $teams, msgs: $msgs, startDate: $startDate, format: $format, venue: $venue, status: $status, winnerTeam: $winnerTeam, ref: $ref, expires: $expires, approxCompletedTs: $approxCompletedTs, cacheKey: $cacheKey, stadium: $stadium, gender: $gender, board: $board)';
  }

  @override
  bool operator ==(covariant Cards other) {
    if (identical(this, other)) return true;

    return other.key == key &&
        other.name == name &&
        other.shortName == shortName &&
        other.relatedName == relatedName &&
        other.title == title &&
        other.season == season &&
        other.teams == teams &&
        other.msgs == msgs &&
        other.startDate == startDate &&
        other.format == format &&
        other.venue == venue &&
        other.status == status &&
        other.winnerTeam == winnerTeam &&
        other.ref == ref &&
        other.expires == expires &&
        other.approxCompletedTs == approxCompletedTs &&
        other.cacheKey == cacheKey &&
        other.stadium == stadium &&
        other.gender == gender &&
        other.board == board;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        name.hashCode ^
        shortName.hashCode ^
        relatedName.hashCode ^
        title.hashCode ^
        season.hashCode ^
        teams.hashCode ^
        msgs.hashCode ^
        startDate.hashCode ^
        format.hashCode ^
        venue.hashCode ^
        status.hashCode ^
        winnerTeam.hashCode ^
        ref.hashCode ^
        expires.hashCode ^
        approxCompletedTs.hashCode ^
        cacheKey.hashCode ^
        stadium.hashCode ^
        gender.hashCode ^
        board.hashCode;
  }
}
