import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/view_status.dart';
import '../../domain/entities/entity_habit_status.dart';
import '../../domain/usecases/uc_delete_habit.dart';
import '../../domain/usecases/uc_get_today_habits.dart';
import '../../domain/usecases/uc_toggle_habit.dart';
import 'state_today_habits.dart';

class CubitTodayHabits extends Cubit<StateTodayHabits> {
  CubitTodayHabits(
    this._ucGetTodayHabits,
    this._ucToggleHabit,
    this._ucDeleteHabit,
  ) : super(const StateTodayHabits());

  final UcGetTodayHabits _ucGetTodayHabits;
  final UcToggleHabit _ucToggleHabit;
  final UcDeleteHabit _ucDeleteHabit;

  /// [silent] reloads without showing the full-screen spinner.
  Future<void> load({bool silent = false}) async {
    if (!silent || state.summary == null) {
      emit(state.copyWith(status: ViewStatus.loading));
    }

    final result = await _ucGetTodayHabits(const NoParams());
    if (isClosed) return;
    result.fold(
      (failure) {
        if (state.summary != null) {
          emit(state.copyWith(
            status: ViewStatus.success,
            actionError: failure.message,
          ));
        } else {
          emit(state.copyWith(
            status: ViewStatus.error,
            errorMessage: failure.message,
          ));
        }
      },
      (summary) => emit(state.copyWith(
        status: ViewStatus.success,
        summary: summary,
        errorMessage: null,
        actionError: null,
      )),
    );
  }

  Future<void> toggle(EntityHabitStatus item) async {
    // Optimistic toggle
    final current = state.summary;
    if (current != null) {
      final updated = current.copyWith(
        items: current.items
            .map((i) => i.habit.id == item.habit.id
                ? i.copyWith(isDone: !i.isDone)
                : i)
            .toList(),
      );
      emit(state.copyWith(summary: updated));
    }

    final result = await _ucToggleHabit(
      ParamsToggleHabit(habitId: item.habit.id, isDone: !item.isDone),
    );
    if (isClosed) return;
    await result.fold(
      (failure) async {
        emit(state.copyWith(actionError: null));
        emit(state.copyWith(actionError: failure.message));
        await load(silent: true); // revert
      },
      (_) => load(silent: true),
    );
  }

  Future<void> delete(String habitId) async {
    // Optimistic removal
    final current = state.summary;
    if (current != null) {
      final updatedItems =
          current.items.where((i) => i.habit.id != habitId).toList();
      final done = updatedItems.where((i) => i.isDone).toList();
      final updated = current.copyWith(
        items: updatedItems,
        earnedPoints: done.fold<int>(0, (s, i) => s + i.habit.points),
        totalPoints: updatedItems.fold<int>(0, (s, i) => s + i.habit.points),
        completedCount: done.length,
        totalCount: updatedItems.length,
      );
      emit(state.copyWith(summary: updated));
    }

    final result = await _ucDeleteHabit(ParamsDeleteHabit(habitId: habitId));
    if (isClosed) return;
    result.fold(
      (failure) {
        emit(state.copyWith(actionError: null));
        emit(state.copyWith(actionError: failure.message));
        load(silent: true); // revert on error
      },
      (_) {}, // already removed optimistically
    );
  }
}
