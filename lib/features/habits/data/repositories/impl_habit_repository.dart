import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/entity_habit.dart';
import '../../domain/entities/entity_streak_day.dart';
import '../../domain/repositories/repository_habit.dart';
import '../datasources/habit_remote_data_source.dart';
import '../models/model_habit.dart';

class ImplHabitRepository implements RepositoryHabit {
  ImplHabitRepository(this._dataSource);

  final HabitRemoteDataSource _dataSource;

  /// Wraps every data source call so the repository never throws.
  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action) async {
    try {
      return Right(await action());
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Firebase error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EntityHabit>>> getHabits() =>
      _guard(() async {
        final models = await _dataSource.getHabits();
        return models.map((m) => m.toEntity()).toList();
      });

  @override
  Future<Either<Failure, EntityHabit>> getHabit(String habitId) =>
      _guard(() async => (await _dataSource.getHabit(habitId)).toEntity());

  @override
  Future<Either<Failure, EntityHabit>> addHabit({
    required String name,
    required String description,
    required int points,
    required String iconName,
    required int durationMinutes,
  }) =>
      _guard(() async {
        final model = await _dataSource.addHabit(
          name: name,
          description: description,
          points: points,
          iconName: iconName,
          durationMinutes: durationMinutes,
        );
        return model.toEntity();
      });

  @override
  Future<Either<Failure, Unit>> deleteHabit(String habitId) =>
      _guard(() async {
        await _dataSource.deleteHabit(habitId);
        return unit;
      });

  @override
  Future<Either<Failure, Set<String>>> getCompletedHabitIds(DateTime date) =>
      _guard(() => _dataSource.getCompletedHabitIds(date));

  @override
  Future<Either<Failure, List<EntityStreakDay>>> getCompletions(
    String habitId,
    List<DateTime> days,
  ) =>
      _guard(() async {
        final flags = await _dataSource.getCompletionFlags(habitId, days);
        return [
          for (var i = 0; i < days.length; i++)
            EntityStreakDay(date: days[i], isDone: flags[i]),
        ];
      });

  @override
  Future<Either<Failure, Unit>> setCompletion({
    required String habitId,
    required DateTime date,
    required bool isDone,
  }) =>
      _guard(() async {
        await _dataSource.setCompletion(
          habitId: habitId,
          date: date,
          isDone: isDone,
        );
        return unit;
      });
}
