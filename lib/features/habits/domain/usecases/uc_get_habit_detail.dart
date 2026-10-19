import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/date_helpers.dart';
import '../entities/entity_habit_detail.dart';
import '../repositories/repository_habit.dart';

class UcGetHabitDetail
    implements UseCase<EntityHabitDetail, ParamsGetHabitDetail> {
  const UcGetHabitDetail(this._repository);

  final RepositoryHabit _repository;

  @override
  Future<Either<Failure, EntityHabitDetail>> call(
    ParamsGetHabitDetail params,
  ) async {
    final today = dateOnly(DateTime.now());
    // Last 7 days, oldest first, today last.
    final days = List.generate(
      7,
      (i) => DateTime(today.year, today.month, today.day - (6 - i)),
    );

    final habitResult = await _repository.getHabit(params.habitId);

    return habitResult.fold<Future<Either<Failure, EntityHabitDetail>>>(
      (failure) async => Left(failure),
      (habit) async {
        final streakResult = await _repository.getCompletions(habit.id, days);
        return streakResult.map(
          (streak) => EntityHabitDetail(
            habit: habit,
            streak: streak,
            isDoneToday: streak.last.isDone,
            doneCount: streak.where((d) => d.isDone).length,
          ),
        );
      },
    );
  }
}

class ParamsGetHabitDetail {
  const ParamsGetHabitDetail({required this.habitId});

  final String habitId;
}
