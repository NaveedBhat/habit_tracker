import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/view_status.dart';
import '../../domain/entities/entity_today_summary.dart';

part 'state_today_habits.freezed.dart';

@freezed
abstract class StateTodayHabits with _$StateTodayHabits {
  const factory StateTodayHabits({
    @Default(ViewStatus.initial) ViewStatus status,
    EntityTodaySummary? summary,
    String? errorMessage,

    /// One-off error (e.g. a failed toggle) shown as a snackbar.
    String? actionError,
  }) = _StateTodayHabits;
}
