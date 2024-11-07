// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseStatsImpl _$$BaseStatsImplFromJson(Map<String, dynamic> json) =>
    _$BaseStatsImpl(
      hp: (json['hp'] as num).toInt(),
      attack: (json['attack'] as num).toInt(),
      defense: (json['defense'] as num).toInt(),
      spAttack: (json['spAttack'] as num).toInt(),
      spDefense: (json['spDefense'] as num).toInt(),
      speed: (json['speed'] as num).toInt(),
    );

Map<String, dynamic> _$$BaseStatsImplToJson(_$BaseStatsImpl instance) =>
    <String, dynamic>{
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'spAttack': instance.spAttack,
      'spDefense': instance.spDefense,
      'speed': instance.speed,
    };
