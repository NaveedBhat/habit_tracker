// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_add_habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StateAddHabit {
  ViewStatus get status;
  String? get errorMessage;

  /// Create a copy of StateAddHabit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StateAddHabitCopyWith<StateAddHabit> get copyWith =>
      _$StateAddHabitCopyWithImpl<StateAddHabit>(
          this as StateAddHabit, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StateAddHabit &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage);

  @override
  String toString() {
    return 'StateAddHabit(status: $status, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $StateAddHabitCopyWith<$Res> {
  factory $StateAddHabitCopyWith(
          StateAddHabit value, $Res Function(StateAddHabit) _then) =
      _$StateAddHabitCopyWithImpl;
  @useResult
  $Res call({ViewStatus status, String? errorMessage});
}

/// @nodoc
class _$StateAddHabitCopyWithImpl<$Res>
    implements $StateAddHabitCopyWith<$Res> {
  _$StateAddHabitCopyWithImpl(this._self, this._then);

  final StateAddHabit _self;
  final $Res Function(StateAddHabit) _then;

  /// Create a copy of StateAddHabit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ViewStatus,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [StateAddHabit].
extension StateAddHabitPatterns on StateAddHabit {
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
    TResult Function(_StateAddHabit value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StateAddHabit() when $default != null:
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
    TResult Function(_StateAddHabit value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateAddHabit():
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
    TResult? Function(_StateAddHabit value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateAddHabit() when $default != null:
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
    TResult Function(ViewStatus status, String? errorMessage)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StateAddHabit() when $default != null:
        return $default(_that.status, _that.errorMessage);
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
    TResult Function(ViewStatus status, String? errorMessage) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateAddHabit():
        return $default(_that.status, _that.errorMessage);
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
    TResult? Function(ViewStatus status, String? errorMessage)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateAddHabit() when $default != null:
        return $default(_that.status, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StateAddHabit implements StateAddHabit {
  const _StateAddHabit({this.status = ViewStatus.initial, this.errorMessage});

  @override
  @JsonKey()
  final ViewStatus status;
  @override
  final String? errorMessage;

  /// Create a copy of StateAddHabit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StateAddHabitCopyWith<_StateAddHabit> get copyWith =>
      __$StateAddHabitCopyWithImpl<_StateAddHabit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StateAddHabit &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage);

  @override
  String toString() {
    return 'StateAddHabit(status: $status, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$StateAddHabitCopyWith<$Res>
    implements $StateAddHabitCopyWith<$Res> {
  factory _$StateAddHabitCopyWith(
          _StateAddHabit value, $Res Function(_StateAddHabit) _then) =
      __$StateAddHabitCopyWithImpl;
  @override
  @useResult
  $Res call({ViewStatus status, String? errorMessage});
}

/// @nodoc
class __$StateAddHabitCopyWithImpl<$Res>
    implements _$StateAddHabitCopyWith<$Res> {
  __$StateAddHabitCopyWithImpl(this._self, this._then);

  final _StateAddHabit _self;
  final $Res Function(_StateAddHabit) _then;

  /// Create a copy of StateAddHabit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_StateAddHabit(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ViewStatus,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
