import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_streak_day.freezed.dart';

@freezed
abstract class EntityStreakDay with _$EntityStreakDay {
  const factory EntityStreakDay({
    required DateTime date,
    required bool isDone,
  }) = _EntityStreakDay;
}
