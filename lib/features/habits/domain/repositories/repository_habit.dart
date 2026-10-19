import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/entity_habit.dart';
import '../entities/entity_streak_day.dart';

abstract class RepositoryHabit {
  Future<Either<Failure, List<EntityHabit>>> getHabits();

  Future<Either<Failure, EntityHabit>> getHabit(String habitId);

  Future<Either<Failure, EntityHabit>> addHabit({
    required String name,
    required String description,
    required int points,
    required String iconName,
    required int durationMinutes,
  });

  Future<Either<Failure, Unit>> deleteHabit(String habitId);

  /// Ids of the habits completed on [date].
  Future<Either<Failure, Set<String>>> getCompletedHabitIds(DateTime date);

  /// One entry per item in [days], same order.
  Future<Either<Failure, List<EntityStreakDay>>> getCompletions(
    String habitId,
    List<DateTime> days,
  );

  Future<Either<Failure, Unit>> setCompletion({
    required String habitId,
    required DateTime date,
    required bool isDone,
  });
}
