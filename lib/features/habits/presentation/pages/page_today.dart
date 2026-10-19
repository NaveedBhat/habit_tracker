import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/habit_icons.dart';
import '../../../../core/utils/view_status.dart';
import '../../../../core/widgets/blob_decoration.dart';
import '../../domain/entities/entity_habit_status.dart';
import '../../domain/entities/entity_today_summary.dart';
import '../cubit/cubit_today_habits.dart';
import '../cubit/state_today_habits.dart';

class PageToday extends StatelessWidget {
  const PageToday({super.key});

  Future<void> _open(BuildContext context, String location) async {
    await context.push(location);
    if (context.mounted) {
      context.read<CubitTodayHabits>().load(silent: true);
    }
  }

  String _formatDate(DateTime d) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return '${days[d.weekday - 1]}, ${d.day} ${months[d.month - 1]}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitTodayHabits, StateTodayHabits>(
      listenWhen: (p, c) =>
          p.actionError != c.actionError && c.actionError != null,
      listener: (ctx, s) => ScaffoldMessenger.of(ctx)
          .showSnackBar(SnackBar(content: Text(s.actionError!))),
      child: Scaffold(
        backgroundColor: AppColors.bg,
        floatingActionButton: _AddFab(onTap: () => _open(context, '/add')),
        body: Stack(
          children: [
            // ── Decorative top-right blob ─────────────────────────────
            Positioned(
              top: -60,
              right: -50,
              child: BlobDecoration(
                size: 270,
                color: AppColors.lavender,
              ),
            ),
            // ── Main content ───────────────────────────────────────
            SafeArea(
              child: BlocBuilder<CubitTodayHabits, StateTodayHabits>(
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
                      return _ErrorBody(
                        msg: state.errorMessage ?? 'Something went wrong',
                        onRetry: () => context.read<CubitTodayHabits>().load(),
                      );
                    case ViewStatus.success:
                      final summary = state.summary!;
                      return RefreshIndicator(
                        color: AppColors.primary,
                        backgroundColor: AppColors.surface,
                        strokeWidth: 2,
                        onRefresh: () =>
                            context.read<CubitTodayHabits>().load(silent: true),
                        child: CustomScrollView(
                          slivers: [
                            // ── Header ──────────────────────────────
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                                child: Row(
                                  children: [
                                    // Avatar placeholder
                                    Container(
                                      width: 46,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryPeach,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: const Icon(
                                        Icons.person_rounded,
                                        color: AppColors.primary,
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Hello there! 👋',
                                            style: TextStyle(
                                              color: AppColors.t2,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            _formatDate(DateTime.now()),
                                            style: const TextStyle(
                                              color: AppColors.t1,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Search icon
                                    Container(
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
                                        Icons.notifications_none_rounded,
                                        color: AppColors.t2,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // ── Daily Challenge banner ───────────────
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: _DailyBanner(summary: summary),
                              ),
                            ),

                            // ── Progress card ────────────────────────
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                                child: _ProgressCard(summary: summary),
                              ),
                            ),

                            // ── Habits section header ────────────────
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Today's Habits",
                                      style: const TextStyle(
                                        color: AppColors.t1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    if (summary.items.isNotEmpty)
                                      GestureDetector(
                                        onTap: () => _open(context, '/all'),
                                        child: const Text(
                                          'See All',
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),

                            // ── Habit list ────────────────────────────
                            if (summary.items.isEmpty)
                              const SliverFillRemaining(
                                hasScrollBody: false,
                                child: _EmptyState(),
                              )
                            else
                                SliverPadding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 120),
                                  sliver: SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (ctx, i) {
                                        final habit = summary.items[i];
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 12),
                                          child: Dismissible(
                                            key: ValueKey(habit.habit.id),
                                            direction:
                                                DismissDirection.endToStart,
                                            dismissThresholds: const {
                                              DismissDirection.endToStart: 0.35,
                                            },
                                            background: _DeleteBackground(),
                                            confirmDismiss: (_) =>
                                                _confirmDelete(ctx, habit.habit.name),
                                            onDismissed: (_) => ctx
                                                .read<CubitTodayHabits>()
                                                .delete(habit.habit.id),
                                            child: _HabitCard(
                                              item: habit,
                                              accentColor:
                                                  AppColors.habitAccents[i %
                                                      AppColors.habitAccents.length],
                                              bgColor: AppColors.habitBgAccents[
                                                  i %
                                                      AppColors.habitBgAccents.length],
                                              onTap: () => _open(ctx,
                                                  '/habit/${habit.habit.id}'),
                                              onToggle: () => ctx
                                                  .read<CubitTodayHabits>()
                                                  .toggle(habit),
                                            ),
                                          ),
                                        );
                                      },
                                      childCount: summary.items.length,
                                    ),
                                  ),
                                ),

                          ],
                        ),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> _confirmDelete(BuildContext context, String habitName) {
    return showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Delete Habit?',
            style: TextStyle(color: AppColors.t1, fontWeight: FontWeight.w800)),
        content: Text(
          '"$habitName" and all its history will be permanently deleted.',
          style: const TextStyle(color: AppColors.t2),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel', style: TextStyle(color: AppColors.t2)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete',
                style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

// ─── Swipe-to-delete background ───────────────────────────────────────────────

class _DeleteBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // No margin here — the Padding wrapper in the list already adds spacing
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

// ─── Daily banner ─────────────────────────────────────────────────────────────

class _DailyBanner extends StatelessWidget {
  const _DailyBanner({required this.summary});
  final EntityTodaySummary summary;

  @override
  Widget build(BuildContext context) {
    final isAllDone =
        summary.totalCount > 0 && summary.completedCount == summary.totalCount;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isAllDone
              ? [const Color(0xFF4CAF50), const Color(0xFF2E7D32)]
              : [AppColors.primary, const Color(0xFFFF8C5A)],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: (isAllDone ? AppColors.done : AppColors.primary)
                .withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isAllDone ? '🎉 All done!' : 'Daily Challenge',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  isAllDone
                      ? 'You crushed all habits today!'
                      : '${summary.totalCount - summary.completedCount} habits left to complete',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 14),
                // Points earned display
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.22),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '⭐ ${summary.earnedPoints} / ${summary.totalPoints} pts',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Decorative icon
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              isAllDone
                  ? Icons.emoji_events_rounded
                  : Icons.local_fire_department_rounded,
              color: Colors.white,
              size: 36,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Progress card ────────────────────────────────────────────────────────────

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({required this.summary});
  final EntityTodaySummary summary;

  @override
  Widget build(BuildContext context) {
    final progress = summary.totalCount == 0
        ? 0.0
        : summary.completedCount / summary.totalCount;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Completion Rate',
                    style: TextStyle(
                      color: AppColors.t2,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${(progress * 100).toInt()}%',
                    style: const TextStyle(
                      color: AppColors.t1,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _StatBadge(
                    label: 'Done',
                    value: '${summary.completedCount}',
                    color: AppColors.done,
                    bg: AppColors.successLight,
                  ),
                  const SizedBox(width: 8),
                  _StatBadge(
                    label: 'Total',
                    value: '${summary.totalCount}',
                    color: AppColors.primary,
                    bg: AppColors.primaryPeach,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.border,
              valueColor: AlwaysStoppedAnimation(
                progress == 1.0 ? AppColors.done : AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${summary.completedCount} of ${summary.totalCount} completed',
                style: const TextStyle(color: AppColors.t2, fontSize: 12),
              ),
              Text(
                '${summary.earnedPoints} pts earned',
                style: const TextStyle(
                  color: AppColors.amber,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  const _StatBadge({
    required this.label,
    required this.value,
    required this.color,
    required this.bg,
  });
  final String label;
  final String value;
  final Color color;
  final Color bg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: color.withValues(alpha: 0.7),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Habit card ────────────────────────────────────────────────────────────────

class _HabitCard extends StatelessWidget {
  const _HabitCard({
    required this.item,
    required this.accentColor,
    required this.bgColor,
    required this.onTap,
    required this.onToggle,
  });

  final EntityHabitStatus item;
  final Color accentColor;
  final Color bgColor;
  final VoidCallback onTap;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final done = item.isDone;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
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
                  color: done ? AppColors.successLight : bgColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: item.habit.iconName.isEmpty
                    ? Center(
                        child: Text(
                          item.habit.name.isNotEmpty
                              ? item.habit.name[0].toUpperCase()
                              : '?',
                          style: TextStyle(
                            color: done ? AppColors.done : accentColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )
                    : Icon(
                        iconFromName(item.habit.iconName),
                        color: done ? AppColors.done : accentColor,
                        size: 24,
                      ),
              ),
              const SizedBox(width: 14),
              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.habit.name,
                      style: TextStyle(
                        color: done ? AppColors.t2 : AppColors.t1,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        decoration:
                            done ? TextDecoration.lineThrough : null,
                        decorationColor: AppColors.t2,
                      ),
                    ),
                    if (item.habit.description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          item.habit.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.t2,
                            fontSize: 12,
                          ),
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
                        '⭐ ${item.habit.points} pts',
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
              const SizedBox(width: 12),
              // Toggle button
              GestureDetector(
                onTap: onToggle,
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: done ? AppColors.done : Colors.transparent,
                    border: Border.all(
                      color: done ? AppColors.done : AppColors.t3,
                      width: 1.5,
                    ),
                  ),
                  child: done
                      ? const Icon(Icons.check_rounded,
                          color: Colors.white, size: 18)
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── FAB ─────────────────────────────────────────────────────────────────────

class _AddFab extends StatelessWidget {
  const _AddFab({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
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
    );
  }
}

// ─── Empty / Error ────────────────────────────────────────────────────────────

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
            child: const Icon(
              Icons.checklist_rounded,
              color: AppColors.primary,
              size: 38,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'No habits yet',
            style: TextStyle(
              color: AppColors.t1,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Tap "+ Add Habit" to create your first habit',
            style: TextStyle(color: AppColors.t2, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.msg, required this.onRetry});
  final String msg;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off_rounded,
                color: AppColors.t2, size: 44),
            const SizedBox(height: 12),
            Text(msg,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.t2, fontSize: 14)),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: onRetry,
              child: const Text('Retry',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
