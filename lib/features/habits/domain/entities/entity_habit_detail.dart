import 'package:freezed_annotation/freezed_annotation.dart';

import 'entity_habit.dart';
import 'entity_streak_day.dart';

part 'entity_habit_detail.freezed.dart';

@freezed
abstract class EntityHabitDetail with _$EntityHabitDetail {
  const factory EntityHabitDetail({
    required EntityHabit habit,

    /// Last 7 days, oldest first. The last item is today.
    required List<EntityStreakDay> streak,
    required bool isDoneToday,
    required int doneCount,
  }) = _EntityHabitDetail;
}
