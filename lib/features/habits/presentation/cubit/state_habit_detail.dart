import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/view_status.dart';
import '../../domain/entities/entity_habit_detail.dart';

part 'state_habit_detail.freezed.dart';

@freezed
abstract class StateHabitDetail with _$StateHabitDetail {
  const factory StateHabitDetail({
    @Default(ViewStatus.initial) ViewStatus status,
    EntityHabitDetail? detail,
    String? errorMessage,
    String? actionError,
  }) = _StateHabitDetail;
}
