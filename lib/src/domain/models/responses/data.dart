import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'card.dart';

class Data {
  final String? cardType;
  final List<dynamic>? intelligentOrder;
  final List<Cards>? cards;
  Data({
    this.cardType,
    this.intelligentOrder,
    this.cards,
  });

  Data copyWith({
    String? cardType,
    List<String>? intelligentOrder,
    List<Cards>? cards,
  }) {
    return Data(
      cardType: cardType ?? this.cardType,
      intelligentOrder: intelligentOrder ?? this.intelligentOrder,
      cards: cards ?? this.cards,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cardType': cardType,
      'intelligentOrder': intelligentOrder,
      'cards': cards?.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      cardType: map['card_type'] as String,
      intelligentOrder:
          List<dynamic>.from((map['intelligent_order'] as List<dynamic>)),
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
  String toString() =>
      'Data(cardType: $cardType, intelligentOrder: $intelligentOrder, cards: $cards)';

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.cardType == cardType &&
        listEquals(other.intelligentOrder, intelligentOrder) &&
        listEquals(other.cards, cards);
  }

  @override
  int get hashCode =>
      cardType.hashCode ^ intelligentOrder.hashCode ^ cards.hashCode;
}
