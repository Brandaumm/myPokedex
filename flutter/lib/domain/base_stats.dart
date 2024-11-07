import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_stats.freezed.dart';
part 'base_stats.g.dart';

@freezed
class BaseStats with _$BaseStats {
  const factory BaseStats({
    required int hp,
    required int attack,
    required int defense,
    required int spAttack,
    required int spDefense,
    required int speed,
  }) = _BaseStats;

  factory BaseStats.fromJson(Map<String, dynamic> json) =>
      _$BaseStatsFromJson(json);
}
