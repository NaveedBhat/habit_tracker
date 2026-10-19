import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/view_status.dart';
import '../../domain/usecases/uc_add_habit.dart';
import 'state_add_habit.dart';

class CubitAddHabit extends Cubit<StateAddHabit> {
  CubitAddHabit(this._ucAddHabit) : super(const StateAddHabit());

  final UcAddHabit _ucAddHabit;

  Future<void> submit({
    required String name,
    required String description,
    required int points,
    required String iconName,
  }) async {
    emit(const StateAddHabit(status: ViewStatus.loading));

    final result = await _ucAddHabit(ParamsAddHabit(
      name: name,
      description: description,
      points: points,
      iconName: iconName,
    ));

    if (isClosed) return;
    result.fold(
      (failure) => emit(StateAddHabit(
        status: ViewStatus.error,
        errorMessage: failure.message,
      )),
      (_) => emit(const StateAddHabit(status: ViewStatus.success)),
    );
  }
}
