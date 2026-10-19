// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_habit_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EntityHabitStatus {
  EntityHabit get habit;
  bool get isDone;

  /// Create a copy of EntityHabitStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EntityHabitStatusCopyWith<EntityHabitStatus> get copyWith =>
      _$EntityHabitStatusCopyWithImpl<EntityHabitStatus>(
          this as EntityHabitStatus, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EntityHabitStatus &&
            (identical(other.habit, habit) || other.habit == habit) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, habit, isDone);

  @override
  String toString() {
    return 'EntityHabitStatus(habit: $habit, isDone: $isDone)';
  }
}

/// @nodoc
abstract mixin class $EntityHabitStatusCopyWith<$Res> {
  factory $EntityHabitStatusCopyWith(
          EntityHabitStatus value, $Res Function(EntityHabitStatus) _then) =
      _$EntityHabitStatusCopyWithImpl;
  @useResult
  $Res call({EntityHabit habit, bool isDone});

  $EntityHabitCopyWith<$Res> get habit;
}

/// @nodoc
class _$EntityHabitStatusCopyWithImpl<$Res>
    implements $EntityHabitStatusCopyWith<$Res> {
  _$EntityHabitStatusCopyWithImpl(this._self, this._then);

  final EntityHabitStatus _self;
  final $Res Function(EntityHabitStatus) _then;

  /// Create a copy of EntityHabitStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habit = null,
    Object? isDone = null,
  }) {
    return _then(_self.copyWith(
      habit: null == habit
          ? _self.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as EntityHabit,
      isDone: null == isDone
          ? _self.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of EntityHabitStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EntityHabitCopyWith<$Res> get habit {
    return $EntityHabitCopyWith<$Res>(_self.habit, (value) {
      return _then(_self.copyWith(habit: value));
    });
  }
}

/// Adds pattern-matching-related methods to [EntityHabitStatus].
extension EntityHabitStatusPatterns on EntityHabitStatus {
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
    TResult Function(_EntityHabitStatus value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EntityHabitStatus() when $default != null:
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
    TResult Function(_EntityHabitStatus value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityHabitStatus():
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
    TResult? Function(_EntityHabitStatus value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityHabitStatus() when $default != null:
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
    TResult Function(EntityHabit habit, bool isDone)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EntityHabitStatus() when $default != null:
        return $default(_that.habit, _that.isDone);
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
    TResult Function(EntityHabit habit, bool isDone) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityHabitStatus():
        return $default(_that.habit, _that.isDone);
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
    TResult? Function(EntityHabit habit, bool isDone)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityHabitStatus() when $default != null:
        return $default(_that.habit, _that.isDone);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EntityHabitStatus implements EntityHabitStatus {
  const _EntityHabitStatus({required this.habit, required this.isDone});

  @override
  final EntityHabit habit;
  @override
  final bool isDone;

  /// Create a copy of EntityHabitStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EntityHabitStatusCopyWith<_EntityHabitStatus> get copyWith =>
      __$EntityHabitStatusCopyWithImpl<_EntityHabitStatus>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EntityHabitStatus &&
            (identical(other.habit, habit) || other.habit == habit) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, habit, isDone);

  @override
  String toString() {
    return 'EntityHabitStatus(habit: $habit, isDone: $isDone)';
  }
}

/// @nodoc
abstract mixin class _$EntityHabitStatusCopyWith<$Res>
    implements $EntityHabitStatusCopyWith<$Res> {
  factory _$EntityHabitStatusCopyWith(
          _EntityHabitStatus value, $Res Function(_EntityHabitStatus) _then) =
      __$EntityHabitStatusCopyWithImpl;
  @override
  @useResult
  $Res call({EntityHabit habit, bool isDone});

  @override
  $EntityHabitCopyWith<$Res> get habit;
}

/// @nodoc
class __$EntityHabitStatusCopyWithImpl<$Res>
    implements _$EntityHabitStatusCopyWith<$Res> {
  __$EntityHabitStatusCopyWithImpl(this._self, this._then);

  final _EntityHabitStatus _self;
  final $Res Function(_EntityHabitStatus) _then;

  /// Create a copy of EntityHabitStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? habit = null,
    Object? isDone = null,
  }) {
    return _then(_EntityHabitStatus(
      habit: null == habit
          ? _self.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as EntityHabit,
      isDone: null == isDone
          ? _self.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of EntityHabitStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EntityHabitCopyWith<$Res> get habit {
    return $EntityHabitCopyWith<$Res>(_self.habit, (value) {
      return _then(_self.copyWith(habit: value));
    });
  }
}

// dart format on
