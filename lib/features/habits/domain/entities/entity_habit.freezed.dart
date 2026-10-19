// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EntityHabit {
  String get id;
  String get name;
  String get description;
  int get points;
  DateTime get createdAt;
  String get iconName;

  /// Create a copy of EntityHabit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EntityHabitCopyWith<EntityHabit> get copyWith =>
      _$EntityHabitCopyWithImpl<EntityHabit>(this as EntityHabit, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EntityHabit &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, points, createdAt, iconName);

  @override
  String toString() {
    return 'EntityHabit(id: $id, name: $name, description: $description, points: $points, createdAt: $createdAt, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class $EntityHabitCopyWith<$Res> {
  factory $EntityHabitCopyWith(
          EntityHabit value, $Res Function(EntityHabit) _then) =
      _$EntityHabitCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      int points,
      DateTime createdAt,
      String iconName});
}

/// @nodoc
class _$EntityHabitCopyWithImpl<$Res> implements $EntityHabitCopyWith<$Res> {
  _$EntityHabitCopyWithImpl(this._self, this._then);

  final EntityHabit _self;
  final $Res Function(EntityHabit) _then;

  /// Create a copy of EntityHabit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? points = null,
    Object? createdAt = null,
    Object? iconName = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      iconName: null == iconName
          ? _self.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [EntityHabit].
extension EntityHabitPatterns on EntityHabit {
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
    TResult Function(_EntityHabit value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EntityHabit() when $default != null:
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
    TResult Function(_EntityHabit value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityHabit():
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
    TResult? Function(_EntityHabit value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityHabit() when $default != null:
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
    TResult Function(String id, String name, String description, int points,
            DateTime createdAt, String iconName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EntityHabit() when $default != null:
        return $default(_that.id, _that.name, _that.description, _that.points,
            _that.createdAt, _that.iconName);
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
    TResult Function(String id, String name, String description, int points,
            DateTime createdAt, String iconName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityHabit():
        return $default(_that.id, _that.name, _that.description, _that.points,
            _that.createdAt, _that.iconName);
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
    TResult? Function(String id, String name, String description, int points,
            DateTime createdAt, String iconName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EntityHabit() when $default != null:
        return $default(_that.id, _that.name, _that.description, _that.points,
            _that.createdAt, _that.iconName);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EntityHabit implements EntityHabit {
  const _EntityHabit(
      {required this.id,
      required this.name,
      required this.description,
      required this.points,
      required this.createdAt,
      this.iconName = ''});

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int points;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final String iconName;

  /// Create a copy of EntityHabit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EntityHabitCopyWith<_EntityHabit> get copyWith =>
      __$EntityHabitCopyWithImpl<_EntityHabit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EntityHabit &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, points, createdAt, iconName);

  @override
  String toString() {
    return 'EntityHabit(id: $id, name: $name, description: $description, points: $points, createdAt: $createdAt, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class _$EntityHabitCopyWith<$Res>
    implements $EntityHabitCopyWith<$Res> {
  factory _$EntityHabitCopyWith(
          _EntityHabit value, $Res Function(_EntityHabit) _then) =
      __$EntityHabitCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      int points,
      DateTime createdAt,
      String iconName});
}

/// @nodoc
class __$EntityHabitCopyWithImpl<$Res> implements _$EntityHabitCopyWith<$Res> {
  __$EntityHabitCopyWithImpl(this._self, this._then);

  final _EntityHabit _self;
  final $Res Function(_EntityHabit) _then;

  /// Create a copy of EntityHabit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? points = null,
    Object? createdAt = null,
    Object? iconName = null,
  }) {
    return _then(_EntityHabit(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      iconName: null == iconName
          ? _self.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
