import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/habit_icons.dart';
import '../../../../core/utils/view_status.dart';
import '../../../../core/widgets/blob_decoration.dart';
import '../../domain/entities/entity_habit.dart';
import '../cubit/cubit_all_habits.dart';
import '../cubit/state_all_habits.dart';

class PageAllHabits extends StatelessWidget {
  const PageAllHabits({super.key});

  Future<void> _openDetail(BuildContext context, String id) async {
    await context.push('/habit/$id');
    if (context.mounted) context.read<CubitAllHabits>().load(silent: true);
  }

  Future<bool?> _confirmDelete(BuildContext context, String habitName) {
    return showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Delete Habit?',
            style: TextStyle(
                color: AppColors.t1, fontWeight: FontWeight.w800)),
        content: Text(
          '"$habitName" and all its history will be permanently deleted.',
          style: const TextStyle(color: AppColors.t2),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child:
                const Text('Cancel', style: TextStyle(color: AppColors.t2)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete',
                style: TextStyle(
                    color: AppColors.error,
                    fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitAllHabits, StateAllHabits>(
      listenWhen: (p, c) =>
          p.actionError != c.actionError && c.actionError != null,
      listener: (ctx, s) => ScaffoldMessenger.of(ctx)
          .showSnackBar(SnackBar(content: Text(s.actionError!))),
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: BlobDecoration(size: 240, color: AppColors.lavender),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AppBar
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.06),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 16,
                              color: AppColors.t1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Text(
                          'All Habits',
                          style: TextStyle(
                            color: AppColors.t1,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Spacer(),
                        BlocBuilder<CubitAllHabits, StateAllHabits>(
                          builder: (context, state) {
                            if (state.habits.isEmpty) return const SizedBox();
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.primaryPeach,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${state.habits.length} habits',
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // Swipe hint
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(20, 10, 20, 2),
                    child: Row(
                      children: [
                        const Icon(Icons.swipe_left_rounded,
                            size: 14, color: AppColors.t3),
                        const SizedBox(width: 4),
                        const Text(
                          'Swipe left to delete',
                          style:
                              TextStyle(color: AppColors.t3, fontSize: 11),
                        ),
                      ],
                    ),
                  ),

                  // Body
                  Expanded(
                    child: BlocBuilder<CubitAllHabits, StateAllHabits>(
                      builder: (context, state) {
                        switch (state.status) {
                          case ViewStatus.initial:
                          case ViewStatus.loading:
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                                strokeWidth: 2.5,
                              ),
                            );
                          case ViewStatus.error:
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.cloud_off_rounded,
                                      color: AppColors.t2, size: 44),
                                  const SizedBox(height: 12),
                                  Text(state.errorMessage ?? 'Error',
                                      style: const TextStyle(
                                          color: AppColors.t2)),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () => context
                                        .read<CubitAllHabits>()
                                        .load(),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                            );
                          case ViewStatus.success:
                            if (state.habits.isEmpty) {
                              return const _EmptyState();
                            }
                            return RefreshIndicator(
                              color: AppColors.primary,
                              backgroundColor: AppColors.surface,
                              onRefresh: () => context
                                  .read<CubitAllHabits>()
                                  .load(silent: true),
                              child: ListView.separated(
                                padding: const EdgeInsets.fromLTRB(
                                    20, 8, 20, 40),
                                itemCount: state.habits.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 12),
                                itemBuilder: (ctx, i) {
                                  final habit = state.habits[i];
                                  final accent = AppColors.habitAccents[
                                      i % AppColors.habitAccents.length];
                                  final bg = AppColors.habitBgAccents[
                                      i % AppColors.habitBgAccents.length];
                                  return Dismissible(
                                    key: ValueKey(habit.id),
                                    direction: DismissDirection.endToStart,
                                    dismissThresholds: const {
                                      DismissDirection.endToStart: 0.35,
                                    },
                                    background: _DeleteBg(),
                                    confirmDismiss: (_) =>
                                        _confirmDelete(ctx, habit.name),
                                    onDismissed: (_) => ctx
                                        .read<CubitAllHabits>()
                                        .delete(habit.id),
                                    child: _HabitListTile(
                                      habit: habit,
                                      accentColor: accent,
                                      bgColor: bg,
                                      onTap: () =>
                                          _openDetail(ctx, habit.id),
                                    ),
                                  );
                                },
                              ),
                            );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: GestureDetector(
          onTap: () async {
            await context.push('/add');
            if (context.mounted) {
              context.read<CubitAllHabits>().load(silent: true);
            }
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add_rounded, color: Colors.white, size: 20),
                SizedBox(width: 6),
                Text(
                  'Add Habit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Swipe-delete background ──────────────────────────────────────────────────

class _DeleteBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.circular(18),
      ),
      alignment: Alignment.centerRight,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.delete_rounded, color: Colors.white, size: 26),
          SizedBox(height: 4),
          Text('Delete',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// ─── Habit list tile ──────────────────────────────────────────────────────────

class _HabitListTile extends StatelessWidget {
  const _HabitListTile({
    required this.habit,
    required this.accentColor,
    required this.bgColor,
    required this.onTap,
  });

  final EntityHabit habit;
  final Color accentColor;
  final Color bgColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon box — shows icon if set, else first letter
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: habit.iconName.isEmpty
                    ? Center(
                        child: Text(
                          habit.name.isNotEmpty
                              ? habit.name[0].toUpperCase()
                              : '?',
                          style: TextStyle(
                            color: accentColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )
                    : Icon(iconFromName(habit.iconName),
                        color: accentColor, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habit.name,
                      style: const TextStyle(
                        color: AppColors.t1,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (habit.description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          habit.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: AppColors.t2, fontSize: 12),
                        ),
                      ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.primaryPeach,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '⭐ ${habit.points} pts',
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Swipe hint arrow
              const Icon(Icons.chevron_right_rounded,
                  color: AppColors.t3, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Empty state ──────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primaryPeach,
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Icon(Icons.checklist_rounded,
                color: AppColors.primary, size: 38),
          ),
          const SizedBox(height: 20),
          const Text(
            'No habits yet',
            style: TextStyle(
                color: AppColors.t1,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          const Text(
            'Tap "+ Add Habit" to get started',
            style: TextStyle(color: AppColors.t2, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
