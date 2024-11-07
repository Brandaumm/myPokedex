// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_database_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDatabaseEntity _$PokemonDatabaseEntityFromJson(
        Map<String, dynamic> json) =>
    PokemonDatabaseEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type1: json['type1'] as String,
      type2: json['type2'] as String?,
      hp: (json['hp'] as num).toInt(),
      attack: (json['attack'] as num).toInt(),
      defense: (json['defense'] as num).toInt(),
      spAttack: (json['sp_attack'] as num).toInt(),
      spDefense: (json['sp_defense'] as num).toInt(),
      speed: (json['speed'] as num).toInt(),
    );

Map<String, dynamic> _$PokemonDatabaseEntityToJson(
        PokemonDatabaseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type1': instance.type1,
      'type2': instance.type2,
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'sp_attack': instance.spAttack,
      'sp_defense': instance.spDefense,
      'speed': instance.speed,
    };
