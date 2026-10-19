import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/view_status.dart';
import '../../domain/usecases/uc_delete_habit.dart';
import '../../domain/usecases/uc_get_habit_detail.dart';
import '../../domain/usecases/uc_toggle_habit.dart';
import 'state_habit_detail.dart';

class CubitHabitDetail extends Cubit<StateHabitDetail> {
  CubitHabitDetail(
    this._ucGetHabitDetail,
    this._ucToggleHabit,
    this._ucDeleteHabit,
  ) : super(const StateHabitDetail());

  final UcGetHabitDetail _ucGetHabitDetail;
  final UcToggleHabit _ucToggleHabit;
  final UcDeleteHabit _ucDeleteHabit;

  Future<void> load(String habitId, {bool silent = false}) async {
    if (!silent || state.detail == null) {
      emit(state.copyWith(status: ViewStatus.loading));
    }

    final result =
        await _ucGetHabitDetail(ParamsGetHabitDetail(habitId: habitId));
    if (isClosed) return;
    result.fold(
      (failure) {
        if (state.detail != null) {
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
      (detail) => emit(state.copyWith(
        status: ViewStatus.success,
        detail: detail,
        errorMessage: null,
        actionError: null,
      )),
    );
  }

  Future<void> toggleToday() async {
    final detail = state.detail;
    if (detail == null) return;

    // Optimistic toggle
    final optimistic = detail.copyWith(isDoneToday: !detail.isDoneToday);
    emit(state.copyWith(detail: optimistic));

    final result = await _ucToggleHabit(
      ParamsToggleHabit(
        habitId: detail.habit.id,
        isDone: !detail.isDoneToday,
      ),
    );
    if (isClosed) return;
    await result.fold(
      (failure) async {
        // Revert on error
        emit(state.copyWith(detail: detail));
        emit(state.copyWith(actionError: null));
        emit(state.copyWith(actionError: failure.message));
      },
      (_) => load(detail.habit.id, silent: true),
    );
  }

  /// Returns true if delete succeeded (so the page can pop).
  Future<bool> deleteHabit() async {
    final id = state.detail?.habit.id;
    if (id == null) return false;
    final result = await _ucDeleteHabit(ParamsDeleteHabit(habitId: id));
    if (isClosed) return false;
    return result.fold(
      (failure) {
        emit(state.copyWith(actionError: null));
        emit(state.copyWith(actionError: failure.message));
        return false;
      },
      (_) => true,
    );
  }
}
