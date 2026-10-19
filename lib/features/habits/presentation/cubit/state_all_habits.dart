import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/view_status.dart';
import '../../domain/entities/entity_habit.dart';

part 'state_all_habits.freezed.dart';

@freezed
abstract class StateAllHabits with _$StateAllHabits {
  const factory StateAllHabits({
    @Default(ViewStatus.initial) ViewStatus status,
    @Default([]) List<EntityHabit> habits,
    String? errorMessage,
    String? actionError,
  }) = _StateAllHabits;
}
