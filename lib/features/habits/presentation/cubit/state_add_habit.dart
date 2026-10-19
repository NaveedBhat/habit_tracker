import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/view_status.dart';

part 'state_add_habit.freezed.dart';

@freezed
abstract class StateAddHabit with _$StateAddHabit {
  const factory StateAddHabit({
    @Default(ViewStatus.initial) ViewStatus status,
    String? errorMessage,
  }) = _StateAddHabit;
}
