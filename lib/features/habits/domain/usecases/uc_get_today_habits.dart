import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/date_helpers.dart';
import '../entities/entity_habit_status.dart';
import '../entities/entity_today_summary.dart';
import '../repositories/repository_habit.dart';

class UcGetTodayHabits implements UseCase<EntityTodaySummary, NoParams> {
  const UcGetTodayHabits(this._repository);

  final RepositoryHabit _repository;

  @override
  Future<Either<Failure, EntityTodaySummary>> call(NoParams params) async {
    final today = dateOnly(DateTime.now());
    final habitsResult = await _repository.getHabits();

    return habitsResult.fold<Future<Either<Failure, EntityTodaySummary>>>(
      (failure) async => Left(failure),
      (habits) async {
        final doneResult = await _repository.getCompletedHabitIds(today);
        return doneResult.map((doneIds) {
          final items = habits
              .map((h) => EntityHabitStatus(
                    habit: h,
                    isDone: doneIds.contains(h.id),
                  ))
              .toList();

          final done = items.where((i) => i.isDone).toList();
          return EntityTodaySummary(
            items: items,
            earnedPoints: done.fold<int>(0, (sum, i) => sum + i.habit.points),
            totalPoints: items.fold<int>(0, (sum, i) => sum + i.habit.points),
            completedCount: done.length,
            totalCount: items.length,
          );
        });
      },
    );
  }
}
