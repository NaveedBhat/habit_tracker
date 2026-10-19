import 'package:freezed_annotation/freezed_annotation.dart';

import 'entity_habit.dart';

part 'entity_habit_status.freezed.dart';

/// A habit together with whether it has been completed today.
@freezed
abstract class EntityHabitStatus with _$EntityHabitStatus {
  const factory EntityHabitStatus({
    required EntityHabit habit,
    required bool isDone,
  }) = _EntityHabitStatus;
}
