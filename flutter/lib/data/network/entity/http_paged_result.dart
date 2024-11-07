import 'package:json_annotation/json_annotation.dart';

part 'http_paged_result.g.dart';

@JsonSerializable()
class HttpPagedResult {
  int first;
  dynamic prev;
  int next;
  int last;
  int pages;
  int items;
  List<PokemonEntity> data;

  HttpPagedResult({
    required this.first,
    required this.prev,
    required this.next,
    required this.last,
    required this.pages,
    required this.items,
    required this.data,
  });

  factory HttpPagedResult.fromJson(Map<String, dynamic> json) =>
      _$HttpPagedResultFromJson(json);
}

@JsonSerializable()
class PokemonEntity {
  final String id;
  final Name name;
  final List<String>? type;
  final Base base;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.base,
  });

  factory PokemonEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonEntityFromJson(json);

  //Map<String, dynamic> toJson() => _$PokemonEntityToJson(this);
}

@JsonSerializable()
class Name {
  final String english;
  final String japanese;
  final String chinese;
  final String french;

  Name({
    required this.english,
    required this.japanese,
    required this.chinese,
    required this.french,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class Base {
  final int hp;
  final int attack;
  final int defense;
  final int spAttack;
  final int spDefense;
  final int speed;

  Base({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spAttack,
    required this.spDefense,
    required this.speed,
  });

  factory Base.fromJson(Map<String, dynamic> json) {
    return Base(
      hp: json['HP'] ?? 0,
      attack: json['Attack'] ?? 0,
      defense: json['Defense'] ?? 0,
      spAttack: json['Sp. Attack'] ?? 0,
      spDefense: json['Sp. Defense'] ?? 0,
      speed: json['Speed'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'HP': hp,
        'Attack': attack,
        'Defense': defense,
        'Sp. Attack': spAttack,
        'Sp. Defense': spDefense,
        'Speed': speed,
      };
}
