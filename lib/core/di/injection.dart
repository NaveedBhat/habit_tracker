import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../../features/habits/data/datasources/habit_remote_data_source.dart';
import '../../features/habits/data/repositories/impl_habit_repository.dart';
import '../../features/habits/domain/repositories/repository_habit.dart';
import '../../features/habits/domain/usecases/uc_add_habit.dart';
import '../../features/habits/domain/usecases/uc_delete_habit.dart';
import '../../features/habits/domain/usecases/uc_get_all_habits.dart';
import '../../features/habits/domain/usecases/uc_get_habit_detail.dart';
import '../../features/habits/domain/usecases/uc_get_today_habits.dart';
import '../../features/habits/domain/usecases/uc_toggle_habit.dart';
import '../../features/habits/presentation/cubit/cubit_add_habit.dart';
import '../../features/habits/presentation/cubit/cubit_all_habits.dart';
import '../../features/habits/presentation/cubit/cubit_habit_detail.dart';
import '../../features/habits/presentation/cubit/cubit_today_habits.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // External
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // Data
  getIt.registerLazySingleton<HabitRemoteDataSource>(
    () => HabitRemoteDataSource(getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<RepositoryHabit>(
    () => ImplHabitRepository(getIt<HabitRemoteDataSource>()),
  );

  // Domain
  getIt.registerLazySingleton<UcGetTodayHabits>(
    () => UcGetTodayHabits(getIt<RepositoryHabit>()),
  );
  getIt.registerLazySingleton<UcGetAllHabits>(
    () => UcGetAllHabits(getIt<RepositoryHabit>()),
  );
  getIt.registerLazySingleton<UcAddHabit>(
    () => UcAddHabit(getIt<RepositoryHabit>()),
  );
  getIt.registerLazySingleton<UcDeleteHabit>(
    () => UcDeleteHabit(getIt<RepositoryHabit>()),
  );
  getIt.registerLazySingleton<UcToggleHabit>(
    () => UcToggleHabit(getIt<RepositoryHabit>()),
  );
  getIt.registerLazySingleton<UcGetHabitDetail>(
    () => UcGetHabitDetail(getIt<RepositoryHabit>()),
  );

  // Presentation (new instance per screen)
  getIt.registerFactory<CubitTodayHabits>(
    () => CubitTodayHabits(
      getIt<UcGetTodayHabits>(),
      getIt<UcToggleHabit>(),
      getIt<UcDeleteHabit>(),
    ),
  );
  getIt.registerFactory<CubitAddHabit>(
    () => CubitAddHabit(getIt<UcAddHabit>()),
  );
  getIt.registerFactory<CubitAllHabits>(
    () => CubitAllHabits(getIt<UcGetAllHabits>(), getIt<UcDeleteHabit>()),
  );
  getIt.registerFactory<CubitHabitDetail>(
    () => CubitHabitDetail(
      getIt<UcGetHabitDetail>(),
      getIt<UcToggleHabit>(),
      getIt<UcDeleteHabit>(),
    ),
  );
}
