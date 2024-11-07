// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseStats _$BaseStatsFromJson(Map<String, dynamic> json) {
  return _BaseStats.fromJson(json);
}

/// @nodoc
mixin _$BaseStats {
  int get hp => throw _privateConstructorUsedError;
  int get attack => throw _privateConstructorUsedError;
  int get defense => throw _privateConstructorUsedError;
  int get spAttack => throw _privateConstructorUsedError;
  int get spDefense => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;

  /// Serializes this BaseStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BaseStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseStatsCopyWith<BaseStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStatsCopyWith<$Res> {
  factory $BaseStatsCopyWith(BaseStats value, $Res Function(BaseStats) then) =
      _$BaseStatsCopyWithImpl<$Res, BaseStats>;
  @useResult
  $Res call(
      {int hp,
      int attack,
      int defense,
      int spAttack,
      int spDefense,
      int speed});
}

/// @nodoc
class _$BaseStatsCopyWithImpl<$Res, $Val extends BaseStats>
    implements $BaseStatsCopyWith<$Res> {
  _$BaseStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hp = null,
    Object? attack = null,
    Object? defense = null,
    Object? spAttack = null,
    Object? spDefense = null,
    Object? speed = null,
  }) {
    return _then(_value.copyWith(
      hp: null == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      attack: null == attack
          ? _value.attack
          : attack // ignore: cast_nullable_to_non_nullable
              as int,
      defense: null == defense
          ? _value.defense
          : defense // ignore: cast_nullable_to_non_nullable
              as int,
      spAttack: null == spAttack
          ? _value.spAttack
          : spAttack // ignore: cast_nullable_to_non_nullable
              as int,
      spDefense: null == spDefense
          ? _value.spDefense
          : spDefense // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseStatsImplCopyWith<$Res>
    implements $BaseStatsCopyWith<$Res> {
  factory _$$BaseStatsImplCopyWith(
          _$BaseStatsImpl value, $Res Function(_$BaseStatsImpl) then) =
      __$$BaseStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int hp,
      int attack,
      int defense,
      int spAttack,
      int spDefense,
      int speed});
}

/// @nodoc
class __$$BaseStatsImplCopyWithImpl<$Res>
    extends _$BaseStatsCopyWithImpl<$Res, _$BaseStatsImpl>
    implements _$$BaseStatsImplCopyWith<$Res> {
  __$$BaseStatsImplCopyWithImpl(
      _$BaseStatsImpl _value, $Res Function(_$BaseStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BaseStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hp = null,
    Object? attack = null,
    Object? defense = null,
    Object? spAttack = null,
    Object? spDefense = null,
    Object? speed = null,
  }) {
    return _then(_$BaseStatsImpl(
      hp: null == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      attack: null == attack
          ? _value.attack
          : attack // ignore: cast_nullable_to_non_nullable
              as int,
      defense: null == defense
          ? _value.defense
          : defense // ignore: cast_nullable_to_non_nullable
              as int,
      spAttack: null == spAttack
          ? _value.spAttack
          : spAttack // ignore: cast_nullable_to_non_nullable
              as int,
      spDefense: null == spDefense
          ? _value.spDefense
          : spDefense // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseStatsImpl implements _BaseStats {
  const _$BaseStatsImpl(
      {required this.hp,
      required this.attack,
      required this.defense,
      required this.spAttack,
      required this.spDefense,
      required this.speed});

  factory _$BaseStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseStatsImplFromJson(json);

  @override
  final int hp;
  @override
  final int attack;
  @override
  final int defense;
  @override
  final int spAttack;
  @override
  final int spDefense;
  @override
  final int speed;

  @override
  String toString() {
    return 'BaseStats(hp: $hp, attack: $attack, defense: $defense, spAttack: $spAttack, spDefense: $spDefense, speed: $speed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseStatsImpl &&
            (identical(other.hp, hp) || other.hp == hp) &&
            (identical(other.attack, attack) || other.attack == attack) &&
            (identical(other.defense, defense) || other.defense == defense) &&
            (identical(other.spAttack, spAttack) ||
                other.spAttack == spAttack) &&
            (identical(other.spDefense, spDefense) ||
                other.spDefense == spDefense) &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hp, attack, defense, spAttack, spDefense, speed);

  /// Create a copy of BaseStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseStatsImplCopyWith<_$BaseStatsImpl> get copyWith =>
      __$$BaseStatsImplCopyWithImpl<_$BaseStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseStatsImplToJson(
      this,
    );
  }
}

abstract class _BaseStats implements BaseStats {
  const factory _BaseStats(
      {required final int hp,
      required final int attack,
      required final int defense,
      required final int spAttack,
      required final int spDefense,
      required final int speed}) = _$BaseStatsImpl;

  factory _BaseStats.fromJson(Map<String, dynamic> json) =
      _$BaseStatsImpl.fromJson;

  @override
  int get hp;
  @override
  int get attack;
  @override
  int get defense;
  @override
  int get spAttack;
  @override
  int get spDefense;
  @override
  int get speed;

  /// Create a copy of BaseStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseStatsImplCopyWith<_$BaseStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
