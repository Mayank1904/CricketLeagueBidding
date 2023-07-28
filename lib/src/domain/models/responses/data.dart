import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'card.dart';

class Data extends Equatable {
  final String? card_type;
  final List<Cards>? cards;
  const Data({
    this.card_type,
    this.cards,
  });

  Data copyWith({
    String? card_type,
    List<String>? intelligent_order,
    List<Cards>? cards,
  }) {
    return Data(
      card_type: card_type ?? this.card_type,
      cards: cards ?? this.cards,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'card_type': card_type,
      'cards': cards?.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      card_type: (map['card_type'] ?? '') as String,
      cards: List<Cards>.from(
        (map['cards'] as List<dynamic>).map<Cards>(
          (x) => Cards.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [card_type, cards];
}
