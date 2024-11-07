import 'package:json_annotation/json_annotation.dart';

part 'pokemon_database_entity.g.dart';

// Responsavel por transformar um Json em um objeto Dart

// Indica que o Json pode se tornar uma classe e vice e versa
@JsonSerializable()
class PokemonDatabaseEntity {
  
  // Mapeamento dos nomes dos campos Json para os nomes da classe Dart
  @JsonKey(name: PokemonDatabaseContract.idColumn)
  final int id;

  @JsonKey(name: PokemonDatabaseContract.nameColumn)
  final String name;

  @JsonKey(name: PokemonDatabaseContract.type1Column)
  final String type1;
  @JsonKey(name: PokemonDatabaseContract.type2Column)
  final String? type2;

  @JsonKey(name: PokemonDatabaseContract.hpColumn)
  final int hp;
  @JsonKey(name: PokemonDatabaseContract.attackColumn)
  final int attack;
  @JsonKey(name: PokemonDatabaseContract.defenseColumn)
  final int defense;
  @JsonKey(name: PokemonDatabaseContract.spAttackColumn)
  final int spAttack;
  @JsonKey(name: PokemonDatabaseContract.spDefenseColumn)
  final int spDefense;
  @JsonKey(name: PokemonDatabaseContract.speedColumn)
  final int speed;

  PokemonDatabaseEntity({
    required this.id,
    required this.name,
    required this.type1,
    required this.type2,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spAttack,
    required this.spDefense,
    required this.speed,
  });

  // Converte um mapa Json em uma instancia PokemonDatabaseEntity
  factory PokemonDatabaseEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonDatabaseEntityFromJson(json);

  // Converte uma classe para Json
  Map<String, dynamic> toJson() => _$PokemonDatabaseEntityToJson(this);
}

abstract class PokemonDatabaseContract {
  static const String pokemonTable = "pokemon_table";
  static const String pokemonTableRandom = "pokemon_table";
  static const String idColumn = "id";
  static const String nameColumn = "name";
  static const String type1Column = "type1";
  static const String type2Column = "type2";
  static const String hpColumn = "hp";
  static const String attackColumn = "attack";
  static const String defenseColumn = "defense";
  static const String spAttackColumn = "sp_attack";
  static const String spDefenseColumn = "sp_defense";
  static const String speedColumn = "speed";
  
}
