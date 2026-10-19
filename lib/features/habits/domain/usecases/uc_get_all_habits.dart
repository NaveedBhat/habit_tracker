import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/entity_habit.dart';
import '../repositories/repository_habit.dart';

/// Returns every habit (no completion data needed).
class UcGetAllHabits implements UseCase<List<EntityHabit>, NoParams> {
  const UcGetAllHabits(this._repository);

  final RepositoryHabit _repository;

  @override
  Future<Either<Failure, List<EntityHabit>>> call(NoParams params) =>
      _repository.getHabits();
}
