import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/repository_habit.dart';

class UcDeleteHabit implements UseCase<Unit, ParamsDeleteHabit> {
  const UcDeleteHabit(this._repo);

  final RepositoryHabit _repo;

  @override
  Future<Either<Failure, Unit>> call(ParamsDeleteHabit p) =>
      _repo.deleteHabit(p.habitId);
}

class ParamsDeleteHabit {
  const ParamsDeleteHabit({required this.habitId});
  final String habitId;
}
