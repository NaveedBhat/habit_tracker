// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_today_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EntityTodaySummary {
  List<EntityHabitStatus> get items;
  int get earnedPoints;
  int get totalPoints;
  int get completedCount;
  int get totalCount;

  /// Create a copy of EntityTodaySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EntityTodaySummaryCopyWith<EntityTodaySummary> get copyWith =>
      _$EntityTodaySummaryCopyWithImpl<EntityTodaySummary>(
          this as EntityTodaySummary, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EntityTodaySummary &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.earnedPoints, earnedPoints) ||
                other.earnedPoints == earnedPoints) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      earnedPoints,
      totalPoints,
      completedCount,
      totalCount);

  @override
  String toString() {
    return 'EntityTodaySummary(items: $items, earnedPoints: $earnedPoints, totalPoints: $totalPoints, completedCount: $completedCount, totalCount: $totalCount)';
  }
}

/// @nodoc
abstract mixin class $EntityTodaySummaryCopyWith<$Res> {
  factory $EntityTodaySummaryCopyWith(
          EntityTodaySummary value, $Res Function(EntityTodaySummary) _then) =
      _$EntityTodaySummaryCopyWithImpl;
  @useResult
  $Res call(
      {List<EntityHabitStatus> items,
      int earnedPoints,
      int totalPoints,
      int completedCount,
      int totalCount});
}

/// @nodoc
class _$EntityTodaySummaryCopyWithImpl<$Res>
    implements $EntityTodaySummaryCopyWith<$Res> {
  _$EntityTodaySummaryCopyWithImpl(this._self, this._then);

  final EntityTodaySummary _self;
  final $Res Function(EntityTodaySummary) _then;

  /// Create a copy of EntityTodaySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? earnedPoints = null,
    Object? totalPoints = null,
    Object? completedCount = null,
    Object? totalCount = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<EntityHabitStatus>,
      earnedPoints: null == earnedPoints
          ? _self.earnedPoints
          : earnedPoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoints: null == totalPoints
          ? _self.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      completedCount: null == completedCount
          ? _self.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [EntityTodaySummary].
extension EntityTodaySummaryPatterns on EntityTodaySummary {
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
    TResult Function(_EntityTodaySummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EntityTodaySummary() when $default != null:
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
    TResult Function(_EntityTodaySummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityTodaySummary():
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
    TResult? Function(_EntityTodaySummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityTodaySummary() when $default != null:
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
    TResult Function(List<EntityHabitStatus> items, int earnedPoints,
            int totalPoints, int completedCount, int totalCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EntityTodaySummary() when $default != null:
        return $default(_that.items, _that.earnedPoints, _that.totalPoints,
            _that.completedCount, _that.totalCount);
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
    TResult Function(List<EntityHabitStatus> items, int earnedPoints,
            int totalPoints, int completedCount, int totalCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityTodaySummary():
        return $default(_that.items, _that.earnedPoints, _that.totalPoints,
            _that.completedCount, _that.totalCount);
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
    TResult? Function(List<EntityHabitStatus> items, int earnedPoints,
            int totalPoints, int completedCount, int totalCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityTodaySummary() when $default != null:
        return $default(_that.items, _that.earnedPoints, _that.totalPoints,
            _that.completedCount, _that.totalCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EntityTodaySummary implements EntityTodaySummary {
  const _EntityTodaySummary(
      {required final List<EntityHabitStatus> items,
      required this.earnedPoints,
      required this.totalPoints,
      required this.completedCount,
      required this.totalCount})
      : _items = items;

  final List<EntityHabitStatus> _items;
  @override
  List<EntityHabitStatus> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int earnedPoints;
  @override
  final int totalPoints;
  @override
  final int completedCount;
  @override
  final int totalCount;

  /// Create a copy of EntityTodaySummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EntityTodaySummaryCopyWith<_EntityTodaySummary> get copyWith =>
      __$EntityTodaySummaryCopyWithImpl<_EntityTodaySummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EntityTodaySummary &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.earnedPoints, earnedPoints) ||
                other.earnedPoints == earnedPoints) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      earnedPoints,
      totalPoints,
      completedCount,
      totalCount);

  @override
  String toString() {
    return 'EntityTodaySummary(items: $items, earnedPoints: $earnedPoints, totalPoints: $totalPoints, completedCount: $completedCount, totalCount: $totalCount)';
  }
}

/// @nodoc
abstract mixin class _$EntityTodaySummaryCopyWith<$Res>
    implements $EntityTodaySummaryCopyWith<$Res> {
  factory _$EntityTodaySummaryCopyWith(
          _EntityTodaySummary value, $Res Function(_EntityTodaySummary) _then) =
      __$EntityTodaySummaryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<EntityHabitStatus> items,
      int earnedPoints,
      int totalPoints,
      int completedCount,
      int totalCount});
}

/// @nodoc
class __$EntityTodaySummaryCopyWithImpl<$Res>
    implements _$EntityTodaySummaryCopyWith<$Res> {
  __$EntityTodaySummaryCopyWithImpl(this._self, this._then);

  final _EntityTodaySummary _self;
  final $Res Function(_EntityTodaySummary) _then;

  /// Create a copy of EntityTodaySummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? earnedPoints = null,
    Object? totalPoints = null,
    Object? completedCount = null,
    Object? totalCount = null,
  }) {
    return _then(_EntityTodaySummary(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<EntityHabitStatus>,
      earnedPoints: null == earnedPoints
          ? _self.earnedPoints
          : earnedPoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoints: null == totalPoints
          ? _self.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      completedCount: null == completedCount
          ? _self.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
