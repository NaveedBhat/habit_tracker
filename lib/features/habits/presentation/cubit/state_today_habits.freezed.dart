// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_today_habits.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StateTodayHabits {
  ViewStatus get status;
  EntityTodaySummary? get summary;
  String? get errorMessage;

  /// One-off error (e.g. a failed toggle) shown as a snackbar.
  String? get actionError;

  /// Create a copy of StateTodayHabits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StateTodayHabitsCopyWith<StateTodayHabits> get copyWith =>
      _$StateTodayHabitsCopyWithImpl<StateTodayHabits>(
          this as StateTodayHabits, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StateTodayHabits &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, summary, errorMessage, actionError);

  @override
  String toString() {
    return 'StateTodayHabits(status: $status, summary: $summary, errorMessage: $errorMessage, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class $StateTodayHabitsCopyWith<$Res> {
  factory $StateTodayHabitsCopyWith(
          StateTodayHabits value, $Res Function(StateTodayHabits) _then) =
      _$StateTodayHabitsCopyWithImpl;
  @useResult
  $Res call(
      {ViewStatus status,
      EntityTodaySummary? summary,
      String? errorMessage,
      String? actionError});

  $EntityTodaySummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$StateTodayHabitsCopyWithImpl<$Res>
    implements $StateTodayHabitsCopyWith<$Res> {
  _$StateTodayHabitsCopyWithImpl(this._self, this._then);

  final StateTodayHabits _self;
  final $Res Function(StateTodayHabits) _then;

  /// Create a copy of StateTodayHabits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? summary = freezed,
    Object? errorMessage = freezed,
    Object? actionError = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ViewStatus,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as EntityTodaySummary?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of StateTodayHabits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EntityTodaySummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
      return null;
    }

    return $EntityTodaySummaryCopyWith<$Res>(_self.summary!, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }
}

/// Adds pattern-matching-related methods to [StateTodayHabits].
extension StateTodayHabitsPatterns on StateTodayHabits {
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
    TResult Function(_StateTodayHabits value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StateTodayHabits() when $default != null:
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
    TResult Function(_StateTodayHabits value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateTodayHabits():
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
    TResult? Function(_StateTodayHabits value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateTodayHabits() when $default != null:
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
    TResult Function(ViewStatus status, EntityTodaySummary? summary,
            String? errorMessage, String? actionError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StateTodayHabits() when $default != null:
        return $default(
            _that.status, _that.summary, _that.errorMessage, _that.actionError);
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
    TResult Function(ViewStatus status, EntityTodaySummary? summary,
            String? errorMessage, String? actionError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateTodayHabits():
        return $default(
            _that.status, _that.summary, _that.errorMessage, _that.actionError);
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
    TResult? Function(ViewStatus status, EntityTodaySummary? summary,
            String? errorMessage, String? actionError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateTodayHabits() when $default != null:
        return $default(
            _that.status, _that.summary, _that.errorMessage, _that.actionError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StateTodayHabits implements StateTodayHabits {
  const _StateTodayHabits(
      {this.status = ViewStatus.initial,
      this.summary,
      this.errorMessage,
      this.actionError});

  @override
  @JsonKey()
  final ViewStatus status;
  @override
  final EntityTodaySummary? summary;
  @override
  final String? errorMessage;

  /// One-off error (e.g. a failed toggle) shown as a snackbar.
  @override
  final String? actionError;

  /// Create a copy of StateTodayHabits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StateTodayHabitsCopyWith<_StateTodayHabits> get copyWith =>
      __$StateTodayHabitsCopyWithImpl<_StateTodayHabits>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StateTodayHabits &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, summary, errorMessage, actionError);

  @override
  String toString() {
    return 'StateTodayHabits(status: $status, summary: $summary, errorMessage: $errorMessage, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class _$StateTodayHabitsCopyWith<$Res>
    implements $StateTodayHabitsCopyWith<$Res> {
  factory _$StateTodayHabitsCopyWith(
          _StateTodayHabits value, $Res Function(_StateTodayHabits) _then) =
      __$StateTodayHabitsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ViewStatus status,
      EntityTodaySummary? summary,
      String? errorMessage,
      String? actionError});

  @override
  $EntityTodaySummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$StateTodayHabitsCopyWithImpl<$Res>
    implements _$StateTodayHabitsCopyWith<$Res> {
  __$StateTodayHabitsCopyWithImpl(this._self, this._then);

  final _StateTodayHabits _self;
  final $Res Function(_StateTodayHabits) _then;

  /// Create a copy of StateTodayHabits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? summary = freezed,
    Object? errorMessage = freezed,
    Object? actionError = freezed,
  }) {
    return _then(_StateTodayHabits(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ViewStatus,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as EntityTodaySummary?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of StateTodayHabits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EntityTodaySummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
      return null;
    }

    return $EntityTodaySummaryCopyWith<$Res>(_self.summary!, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }
}

// dart format on
