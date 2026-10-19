import 'package:freezed_annotation/freezed_annotation.dart';

import 'entity_habit_status.dart';

part 'entity_today_summary.freezed.dart';

@freezed
abstract class EntityTodaySummary with _$EntityTodaySummary {
  const factory EntityTodaySummary({
    required List<EntityHabitStatus> items,
    required int earnedPoints,
    required int totalPoints,
    required int completedCount,
    required int totalCount,
  }) = _EntityTodaySummary;
}
