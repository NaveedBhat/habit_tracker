import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/entity_habit.dart';
import '../repositories/repository_habit.dart';

class UcAddHabit implements UseCase<EntityHabit, ParamsAddHabit> {
  const UcAddHabit(this._repository);

  final RepositoryHabit _repository;

  static const int maxPoints = 1000;

  @override
  Future<Either<Failure, EntityHabit>> call(ParamsAddHabit params) async {
    final name = params.name.trim();
    final description = params.description.trim();

    if (name.isEmpty) {
      return const Left(ValidationFailure('Habit name is required'));
    }
    if (params.points <= 0 || params.points > maxPoints) {
      return const Left(
        ValidationFailure('Points must be between 1 and $maxPoints'),
      );
    }

    return _repository.addHabit(
      name: name,
      description: description,
      points: params.points,
      iconName: params.iconName,
    );
  }
}

class ParamsAddHabit {
  const ParamsAddHabit({
    required this.name,
    required this.description,
    required this.points,
    required this.iconName,
  });

  final String name;
  final String description;
  final int points;
  final String iconName;
}
