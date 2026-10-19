import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/date_helpers.dart';
import '../repositories/repository_habit.dart';

/// Marks a habit done / not done for today.
class UcToggleHabit implements UseCase<Unit, ParamsToggleHabit> {
  const UcToggleHabit(this._repository);

  final RepositoryHabit _repository;

  @override
  Future<Either<Failure, Unit>> call(ParamsToggleHabit params) async {
    if (params.habitId.isEmpty) {
      return const Left(ValidationFailure('Habit id is required'));
    }
    return _repository.setCompletion(
      habitId: params.habitId,
      date: dateOnly(DateTime.now()),
      isDone: params.isDone,
    );
  }
}

class ParamsToggleHabit {
  const ParamsToggleHabit({required this.habitId, required this.isDone});

  final String habitId;

  /// The NEW state the habit should have.
  final bool isDone;
}
