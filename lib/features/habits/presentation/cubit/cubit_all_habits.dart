import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/view_status.dart';
import '../../domain/usecases/uc_delete_habit.dart';
import '../../domain/usecases/uc_get_all_habits.dart';
import 'state_all_habits.dart';

class CubitAllHabits extends Cubit<StateAllHabits> {
  CubitAllHabits(this._ucGetAllHabits, this._ucDeleteHabit)
      : super(const StateAllHabits());

  final UcGetAllHabits _ucGetAllHabits;
  final UcDeleteHabit _ucDeleteHabit;

  Future<void> load({bool silent = false}) async {
    if (!silent || state.habits.isEmpty) {
      emit(state.copyWith(status: ViewStatus.loading));
    }
    final result = await _ucGetAllHabits(const NoParams());
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(
        status: ViewStatus.error,
        errorMessage: failure.message,
      )),
      (habits) => emit(state.copyWith(
        status: ViewStatus.success,
        habits: habits,
        errorMessage: null,
        actionError: null,
      )),
    );
  }

  Future<void> delete(String habitId) async {
    // Optimistic removal
    final updated = state.habits.where((h) => h.id != habitId).toList();
    emit(state.copyWith(habits: updated));

    final result = await _ucDeleteHabit(ParamsDeleteHabit(habitId: habitId));
    if (isClosed) return;
    result.fold(
      (failure) {
        // Revert on error
        emit(state.copyWith(actionError: null));
        emit(state.copyWith(actionError: failure.message));
        load(silent: true);
      },
      (_) {}, // already removed optimistically
    );
  }
}
