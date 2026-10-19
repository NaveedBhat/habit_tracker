// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_all_habits.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StateAllHabits {
  ViewStatus get status;
  List<EntityHabit> get habits;
  String? get errorMessage;
  String? get actionError;

  /// Create a copy of StateAllHabits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StateAllHabitsCopyWith<StateAllHabits> get copyWith =>
      _$StateAllHabitsCopyWithImpl<StateAllHabits>(
          this as StateAllHabits, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StateAllHabits &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.habits, habits) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(habits), errorMessage, actionError);

  @override
  String toString() {
    return 'StateAllHabits(status: $status, habits: $habits, errorMessage: $errorMessage, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class $StateAllHabitsCopyWith<$Res> {
  factory $StateAllHabitsCopyWith(
          StateAllHabits value, $Res Function(StateAllHabits) _then) =
      _$StateAllHabitsCopyWithImpl;
  @useResult
  $Res call(
      {ViewStatus status,
      List<EntityHabit> habits,
      String? errorMessage,
      String? actionError});
}

/// @nodoc
class _$StateAllHabitsCopyWithImpl<$Res>
    implements $StateAllHabitsCopyWith<$Res> {
  _$StateAllHabitsCopyWithImpl(this._self, this._then);

  final StateAllHabits _self;
  final $Res Function(StateAllHabits) _then;

  /// Create a copy of StateAllHabits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? habits = null,
    Object? errorMessage = freezed,
    Object? actionError = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ViewStatus,
      habits: null == habits
          ? _self.habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<EntityHabit>,
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
}

/// Adds pattern-matching-related methods to [StateAllHabits].
extension StateAllHabitsPatterns on StateAllHabits {
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
    TResult Function(_StateAllHabits value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StateAllHabits() when $default != null:
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
    TResult Function(_StateAllHabits value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateAllHabits():
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
    TResult? Function(_StateAllHabits value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateAllHabits() when $default != null:
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
    TResult Function(ViewStatus status, List<EntityHabit> habits,
            String? errorMessage, String? actionError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StateAllHabits() when $default != null:
        return $default(
            _that.status, _that.habits, _that.errorMessage, _that.actionError);
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
    TResult Function(ViewStatus status, List<EntityHabit> habits,
            String? errorMessage, String? actionError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateAllHabits():
        return $default(
            _that.status, _that.habits, _that.errorMessage, _that.actionError);
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
    TResult? Function(ViewStatus status, List<EntityHabit> habits,
            String? errorMessage, String? actionError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateAllHabits() when $default != null:
        return $default(
            _that.status, _that.habits, _that.errorMessage, _that.actionError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StateAllHabits implements StateAllHabits {
  const _StateAllHabits(
      {this.status = ViewStatus.initial,
      final List<EntityHabit> habits = const [],
      this.errorMessage,
      this.actionError})
      : _habits = habits;

  @override
  @JsonKey()
  final ViewStatus status;
  final List<EntityHabit> _habits;
  @override
  @JsonKey()
  List<EntityHabit> get habits {
    if (_habits is EqualUnmodifiableListView) return _habits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habits);
  }

  @override
  final String? errorMessage;
  @override
  final String? actionError;

  /// Create a copy of StateAllHabits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StateAllHabitsCopyWith<_StateAllHabits> get copyWith =>
      __$StateAllHabitsCopyWithImpl<_StateAllHabits>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StateAllHabits &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._habits, _habits) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_habits), errorMessage, actionError);

  @override
  String toString() {
    return 'StateAllHabits(status: $status, habits: $habits, errorMessage: $errorMessage, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class _$StateAllHabitsCopyWith<$Res>
    implements $StateAllHabitsCopyWith<$Res> {
  factory _$StateAllHabitsCopyWith(
          _StateAllHabits value, $Res Function(_StateAllHabits) _then) =
      __$StateAllHabitsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ViewStatus status,
      List<EntityHabit> habits,
      String? errorMessage,
      String? actionError});
}

/// @nodoc
class __$StateAllHabitsCopyWithImpl<$Res>
    implements _$StateAllHabitsCopyWith<$Res> {
  __$StateAllHabitsCopyWithImpl(this._self, this._then);

  final _StateAllHabits _self;
  final $Res Function(_StateAllHabits) _then;

  /// Create a copy of StateAllHabits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? habits = null,
    Object? errorMessage = freezed,
    Object? actionError = freezed,
  }) {
    return _then(_StateAllHabits(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ViewStatus,
      habits: null == habits
          ? _self._habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<EntityHabit>,
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
}

// dart format on
