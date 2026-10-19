import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_habit.freezed.dart';

@freezed
abstract class EntityHabit with _$EntityHabit {
  const factory EntityHabit({
    required String id,
    required String name,
    required String description,
    required int points,
    required DateTime createdAt,
    @Default('') String iconName,
    @Default(5) int durationMinutes, // how long the habit takes, in minutes
  }) = _EntityHabit;
}
