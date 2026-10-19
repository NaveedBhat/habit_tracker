// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_habit_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EntityHabitDetail {
  EntityHabit get habit;

  /// Last 7 days, oldest first. The last item is today.
  List<EntityStreakDay> get streak;
  bool get isDoneToday;
  int get doneCount;

  /// Create a copy of EntityHabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EntityHabitDetailCopyWith<EntityHabitDetail> get copyWith =>
      _$EntityHabitDetailCopyWithImpl<EntityHabitDetail>(
          this as EntityHabitDetail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EntityHabitDetail &&
            (identical(other.habit, habit) || other.habit == habit) &&
            const DeepCollectionEquality().equals(other.streak, streak) &&
            (identical(other.isDoneToday, isDoneToday) ||
                other.isDoneToday == isDoneToday) &&
            (identical(other.doneCount, doneCount) ||
                other.doneCount == doneCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, habit,
      const DeepCollectionEquality().hash(streak), isDoneToday, doneCount);

  @override
  String toString() {
    return 'EntityHabitDetail(habit: $habit, streak: $streak, isDoneToday: $isDoneToday, doneCount: $doneCount)';
  }
}

/// @nodoc
abstract mixin class $EntityHabitDetailCopyWith<$Res> {
  factory $EntityHabitDetailCopyWith(
          EntityHabitDetail value, $Res Function(EntityHabitDetail) _then) =
      _$EntityHabitDetailCopyWithImpl;
  @useResult
  $Res call(
      {EntityHabit habit,
      List<EntityStreakDay> streak,
      bool isDoneToday,
      int doneCount});

  $EntityHabitCopyWith<$Res> get habit;
}

/// @nodoc
class _$EntityHabitDetailCopyWithImpl<$Res>
    implements $EntityHabitDetailCopyWith<$Res> {
  _$EntityHabitDetailCopyWithImpl(this._self, this._then);

  final EntityHabitDetail _self;
  final $Res Function(EntityHabitDetail) _then;

  /// Create a copy of EntityHabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habit = null,
    Object? streak = null,
    Object? isDoneToday = null,
    Object? doneCount = null,
  }) {
    return _then(_self.copyWith(
      habit: null == habit
          ? _self.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as EntityHabit,
      streak: null == streak
          ? _self.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as List<EntityStreakDay>,
      isDoneToday: null == isDoneToday
          ? _self.isDoneToday
          : isDoneToday // ignore: cast_nullable_to_non_nullable
              as bool,
      doneCount: null == doneCount
          ? _self.doneCount
          : doneCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of EntityHabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EntityHabitCopyWith<$Res> get habit {
    return $EntityHabitCopyWith<$Res>(_self.habit, (value) {
      return _then(_self.copyWith(habit: value));
    });
  }
}

/// Adds pattern-matching-related methods to [EntityHabitDetail].
extension EntityHabitDetailPatterns on EntityHabitDetail {
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
    TResult Function(_EntityHabitDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EntityHabitDetail() when $default != null:
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
    TResult Function(_EntityHabitDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityHabitDetail():
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
    TResult? Function(_EntityHabitDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityHabitDetail() when $default != null:
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
    TResult Function(EntityHabit habit, List<EntityStreakDay> streak,
            bool isDoneToday, int doneCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EntityHabitDetail() when $default != null:
        return $default(
            _that.habit, _that.streak, _that.isDoneToday, _that.doneCount);
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
    TResult Function(EntityHabit habit, List<EntityStreakDay> streak,
            bool isDoneToday, int doneCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityHabitDetail():
        return $default(
            _that.habit, _that.streak, _that.isDoneToday, _that.doneCount);
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
    TResult? Function(EntityHabit habit, List<EntityStreakDay> streak,
            bool isDoneToday, int doneCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityHabitDetail() when $default != null:
        return $default(
            _that.habit, _that.streak, _that.isDoneToday, _that.doneCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EntityHabitDetail implements EntityHabitDetail {
  const _EntityHabitDetail(
      {required this.habit,
      required final List<EntityStreakDay> streak,
      required this.isDoneToday,
      required this.doneCount})
      : _streak = streak;

  @override
  final EntityHabit habit;

  /// Last 7 days, oldest first. The last item is today.
  final List<EntityStreakDay> _streak;

  /// Last 7 days, oldest first. The last item is today.
  @override
  List<EntityStreakDay> get streak {
    if (_streak is EqualUnmodifiableListView) return _streak;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_streak);
  }

  @override
  final bool isDoneToday;
  @override
  final int doneCount;

  /// Create a copy of EntityHabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EntityHabitDetailCopyWith<_EntityHabitDetail> get copyWith =>
      __$EntityHabitDetailCopyWithImpl<_EntityHabitDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EntityHabitDetail &&
            (identical(other.habit, habit) || other.habit == habit) &&
            const DeepCollectionEquality().equals(other._streak, _streak) &&
            (identical(other.isDoneToday, isDoneToday) ||
                other.isDoneToday == isDoneToday) &&
            (identical(other.doneCount, doneCount) ||
                other.doneCount == doneCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, habit,
      const DeepCollectionEquality().hash(_streak), isDoneToday, doneCount);

  @override
  String toString() {
    return 'EntityHabitDetail(habit: $habit, streak: $streak, isDoneToday: $isDoneToday, doneCount: $doneCount)';
  }
}

/// @nodoc
abstract mixin class _$EntityHabitDetailCopyWith<$Res>
    implements $EntityHabitDetailCopyWith<$Res> {
  factory _$EntityHabitDetailCopyWith(
          _EntityHabitDetail value, $Res Function(_EntityHabitDetail) _then) =
      __$EntityHabitDetailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {EntityHabit habit,
      List<EntityStreakDay> streak,
      bool isDoneToday,
      int doneCount});

  @override
  $EntityHabitCopyWith<$Res> get habit;
}

/// @nodoc
class __$EntityHabitDetailCopyWithImpl<$Res>
    implements _$EntityHabitDetailCopyWith<$Res> {
  __$EntityHabitDetailCopyWithImpl(this._self, this._then);

  final _EntityHabitDetail _self;
  final $Res Function(_EntityHabitDetail) _then;

  /// Create a copy of EntityHabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? habit = null,
    Object? streak = null,
    Object? isDoneToday = null,
    Object? doneCount = null,
  }) {
    return _then(_EntityHabitDetail(
      habit: null == habit
          ? _self.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as EntityHabit,
      streak: null == streak
          ? _self._streak
          : streak // ignore: cast_nullable_to_non_nullable
              as List<EntityStreakDay>,
      isDoneToday: null == isDoneToday
          ? _self.isDoneToday
          : isDoneToday // ignore: cast_nullable_to_non_nullable
              as bool,
      doneCount: null == doneCount
          ? _self.doneCount
          : doneCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of EntityHabitDetail
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
