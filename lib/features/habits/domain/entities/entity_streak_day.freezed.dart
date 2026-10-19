// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_streak_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EntityStreakDay {
  DateTime get date;
  bool get isDone;

  /// Create a copy of EntityStreakDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EntityStreakDayCopyWith<EntityStreakDay> get copyWith =>
      _$EntityStreakDayCopyWithImpl<EntityStreakDay>(
          this as EntityStreakDay, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EntityStreakDay &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, isDone);

  @override
  String toString() {
    return 'EntityStreakDay(date: $date, isDone: $isDone)';
  }
}

/// @nodoc
abstract mixin class $EntityStreakDayCopyWith<$Res> {
  factory $EntityStreakDayCopyWith(
          EntityStreakDay value, $Res Function(EntityStreakDay) _then) =
      _$EntityStreakDayCopyWithImpl;
  @useResult
  $Res call({DateTime date, bool isDone});
}

/// @nodoc
class _$EntityStreakDayCopyWithImpl<$Res>
    implements $EntityStreakDayCopyWith<$Res> {
  _$EntityStreakDayCopyWithImpl(this._self, this._then);

  final EntityStreakDay _self;
  final $Res Function(EntityStreakDay) _then;

  /// Create a copy of EntityStreakDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? isDone = null,
  }) {
    return _then(_self.copyWith(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDone: null == isDone
          ? _self.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [EntityStreakDay].
extension EntityStreakDayPatterns on EntityStreakDay {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EntityStreakDay value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EntityStreakDay() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EntityStreakDay value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityStreakDay():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EntityStreakDay value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityStreakDay() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(DateTime date, bool isDone)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EntityStreakDay() when $default != null:
        return $default(_that.date, _that.isDone);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(DateTime date, bool isDone) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityStreakDay():
        return $default(_that.date, _that.isDone);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(DateTime date, bool isDone)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityStreakDay() when $default != null:
        return $default(_that.date, _that.isDone);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EntityStreakDay implements EntityStreakDay {
  const _EntityStreakDay({required this.date, required this.isDone});

  @override
  final DateTime date;
  @override
  final bool isDone;

  /// Create a copy of EntityStreakDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EntityStreakDayCopyWith<_EntityStreakDay> get copyWith =>
      __$EntityStreakDayCopyWithImpl<_EntityStreakDay>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EntityStreakDay &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, isDone);

  @override
  String toString() {
    return 'EntityStreakDay(date: $date, isDone: $isDone)';
  }
}

/// @nodoc
abstract mixin class _$EntityStreakDayCopyWith<$Res>
    implements $EntityStreakDayCopyWith<$Res> {
  factory _$EntityStreakDayCopyWith(
          _EntityStreakDay value, $Res Function(_EntityStreakDay) _then) =
      __$EntityStreakDayCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime date, bool isDone});
}

/// @nodoc
class __$EntityStreakDayCopyWithImpl<$Res>
    implements _$EntityStreakDayCopyWith<$Res> {
  __$EntityStreakDayCopyWithImpl(this._self, this._then);

  final _EntityStreakDay _self;
  final $Res Function(_EntityStreakDay) _then;

  /// Create a copy of EntityStreakDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
    Object? isDone = null,
  }) {
    return _then(_EntityStreakDay(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDone: null == isDone
          ? _self.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
