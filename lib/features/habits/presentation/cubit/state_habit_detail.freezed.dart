// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_habit_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StateHabitDetail {
  ViewStatus get status;
  EntityHabitDetail? get detail;
  String? get errorMessage;
  String? get actionError;

  /// Create a copy of StateHabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StateHabitDetailCopyWith<StateHabitDetail> get copyWith =>
      _$StateHabitDetailCopyWithImpl<StateHabitDetail>(
          this as StateHabitDetail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StateHabitDetail &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, detail, errorMessage, actionError);

  @override
  String toString() {
    return 'StateHabitDetail(status: $status, detail: $detail, errorMessage: $errorMessage, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class $StateHabitDetailCopyWith<$Res> {
  factory $StateHabitDetailCopyWith(
          StateHabitDetail value, $Res Function(StateHabitDetail) _then) =
      _$StateHabitDetailCopyWithImpl;
  @useResult
  $Res call(
      {ViewStatus status,
      EntityHabitDetail? detail,
      String? errorMessage,
      String? actionError});

  $EntityHabitDetailCopyWith<$Res>? get detail;
}

/// @nodoc
class _$StateHabitDetailCopyWithImpl<$Res>
    implements $StateHabitDetailCopyWith<$Res> {
  _$StateHabitDetailCopyWithImpl(this._self, this._then);

  final StateHabitDetail _self;
  final $Res Function(StateHabitDetail) _then;

  /// Create a copy of StateHabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? detail = freezed,
    Object? errorMessage = freezed,
    Object? actionError = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ViewStatus,
      detail: freezed == detail
          ? _self.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as EntityHabitDetail?,
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

  /// Create a copy of StateHabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EntityHabitDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
      return null;
    }

    return $EntityHabitDetailCopyWith<$Res>(_self.detail!, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }
}

/// Adds pattern-matching-related methods to [StateHabitDetail].
extension StateHabitDetailPatterns on StateHabitDetail {
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
    TResult Function(_StateHabitDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StateHabitDetail() when $default != null:
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
    TResult Function(_StateHabitDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateHabitDetail():
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
    TResult? Function(_StateHabitDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateHabitDetail() when $default != null:
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
    TResult Function(ViewStatus status, EntityHabitDetail? detail,
            String? errorMessage, String? actionError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StateHabitDetail() when $default != null:
        return $default(
            _that.status, _that.detail, _that.errorMessage, _that.actionError);
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
    TResult Function(ViewStatus status, EntityHabitDetail? detail,
            String? errorMessage, String? actionError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateHabitDetail():
        return $default(
            _that.status, _that.detail, _that.errorMessage, _that.actionError);
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
    TResult? Function(ViewStatus status, EntityHabitDetail? detail,
            String? errorMessage, String? actionError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StateHabitDetail() when $default != null:
        return $default(
            _that.status, _that.detail, _that.errorMessage, _that.actionError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StateHabitDetail implements StateHabitDetail {
  const _StateHabitDetail(
      {this.status = ViewStatus.initial,
      this.detail,
      this.errorMessage,
      this.actionError});

  @override
  @JsonKey()
  final ViewStatus status;
  @override
  final EntityHabitDetail? detail;
  @override
  final String? errorMessage;
  @override
  final String? actionError;

  /// Create a copy of StateHabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StateHabitDetailCopyWith<_StateHabitDetail> get copyWith =>
      __$StateHabitDetailCopyWithImpl<_StateHabitDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StateHabitDetail &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, detail, errorMessage, actionError);

  @override
  String toString() {
    return 'StateHabitDetail(status: $status, detail: $detail, errorMessage: $errorMessage, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class _$StateHabitDetailCopyWith<$Res>
    implements $StateHabitDetailCopyWith<$Res> {
  factory _$StateHabitDetailCopyWith(
          _StateHabitDetail value, $Res Function(_StateHabitDetail) _then) =
      __$StateHabitDetailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ViewStatus status,
      EntityHabitDetail? detail,
      String? errorMessage,
      String? actionError});

  @override
  $EntityHabitDetailCopyWith<$Res>? get detail;
}

/// @nodoc
class __$StateHabitDetailCopyWithImpl<$Res>
    implements _$StateHabitDetailCopyWith<$Res> {
  __$StateHabitDetailCopyWithImpl(this._self, this._then);

  final _StateHabitDetail _self;
  final $Res Function(_StateHabitDetail) _then;

  /// Create a copy of StateHabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? detail = freezed,
    Object? errorMessage = freezed,
    Object? actionError = freezed,
  }) {
    return _then(_StateHabitDetail(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ViewStatus,
      detail: freezed == detail
          ? _self.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as EntityHabitDetail?,
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

  /// Create a copy of StateHabitDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EntityHabitDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
      return null;
    }

    return $EntityHabitDetailCopyWith<$Res>(_self.detail!, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }
}

// dart format on
