import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/habits/presentation/cubit/cubit_add_habit.dart';
import '../../features/habits/presentation/cubit/cubit_all_habits.dart';
import '../../features/habits/presentation/cubit/cubit_habit_detail.dart';
import '../../features/habits/presentation/cubit/cubit_today_habits.dart';
import '../../features/habits/presentation/pages/page_add_habit.dart';
import '../../features/habits/presentation/pages/page_all_habits.dart';
import '../../features/habits/presentation/pages/page_habit_detail.dart';
import '../../features/habits/presentation/pages/page_today.dart';
import '../di/injection.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<CubitTodayHabits>()..load(),
        child: const PageToday(),
      ),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<CubitAddHabit>(),
        child: const PageAddHabit(),
      ),
    ),
    GoRoute(
      path: '/all',
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<CubitAllHabits>()..load(),
        child: const PageAllHabits(),
      ),
    ),
    GoRoute(
      path: '/habit/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BlocProvider(
          create: (_) => getIt<CubitHabitDetail>()..load(id),
          child: PageHabitDetail(habitId: id),
        );
      },
    ),
  ],
);
