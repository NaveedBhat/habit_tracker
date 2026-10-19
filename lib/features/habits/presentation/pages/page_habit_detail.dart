import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/habit_icons.dart';
import '../../../../core/utils/view_status.dart';
import '../../../../core/widgets/blob_decoration.dart';
import '../../../../core/widgets/shimmer_skeleton.dart';
import '../../domain/entities/entity_habit_detail.dart';
import '../../domain/entities/entity_streak_day.dart';
import '../cubit/cubit_habit_detail.dart';
import '../cubit/state_habit_detail.dart';

class PageHabitDetail extends StatelessWidget {
  const PageHabitDetail({super.key, required this.habitId});

  final String habitId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitHabitDetail, StateHabitDetail>(
      listenWhen: (p, c) =>
          p.actionError != c.actionError && c.actionError != null,
      listener: (ctx, state) => ScaffoldMessenger.of(ctx)
          .showSnackBar(SnackBar(content: Text(state.actionError!))),
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: Stack(
          children: [
            // Decorative top-right blob
            Positioned(
              top: -60,
              right: -50,
              child: BlobDecoration(
                size: 260,
                color: AppColors.lavender,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  // Custom app bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
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
                          'Habit Details',
                          style: TextStyle(
                            color: AppColors.t1,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Spacer(),
                        // Delete button
                        GestureDetector(
                          onTap: () => _confirmDelete(context),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF0F0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.delete_outline_rounded,
                              color: AppColors.error,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Body
                  Expanded(
                    child: BlocBuilder<CubitHabitDetail, StateHabitDetail>(
                      builder: (context, state) {
                        switch (state.status) {
                          case ViewStatus.initial:
                          case ViewStatus.loading:
                            return const HabitDetailSkeleton();
                          case ViewStatus.error:
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 72,
                                      height: 72,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryPeach,
                                        borderRadius:
                                            BorderRadius.circular(20),
                                      ),
                                      child: const Icon(
                                        Icons.cloud_off_rounded,
                                        color: AppColors.primary,
                                        size: 36,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      state.errorMessage ??
                                          'Something went wrong',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: AppColors.t2),
                                    ),
                                    const SizedBox(height: 18),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () =>
                                          context
                                              .read<CubitHabitDetail>()
                                              .load(habitId),
                                      child: const Text('Retry'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          case ViewStatus.success:
                            return _Content(detail: state.detail!);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF0F0),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.delete_rounded, color: AppColors.error, size: 28),
            ),
            const SizedBox(height: 16),
            const Text(
              'Delete Habit?',
              style: TextStyle(color: AppColors.t1, fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            const Text(
              'This habit and all its history will be permanently deleted.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.t2, fontSize: 13, height: 1.5),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.border),
                      foregroundColor: AppColors.t2,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text('Cancel', style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      final deleted = await context.read<CubitHabitDetail>().deleteHabit();
                      if (deleted && context.mounted) Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text('Delete', style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Detail content ───────────────────────────────────────────────────────────

class _Content extends StatelessWidget {
  const _Content({required this.detail});

  final EntityHabitDetail detail;

  @override
  Widget build(BuildContext context) {
    final habit = detail.habit;
    final done = detail.isDoneToday;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      children: [
        // ── Habit hero card ─────────────────────────────────────────────
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: done
                  ? [AppColors.done, const Color(0xFF2E7D32)]
                  : [AppColors.primary, const Color(0xFFFF8C5A)],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: (done ? AppColors.done : AppColors.primary)
                    .withValues(alpha: 0.35),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon + Name row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.22),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: habit.iconName.isEmpty
                        ? Center(
                            child: Text(
                              habit.name.isNotEmpty
                                  ? habit.name[0].toUpperCase()
                                  : '?',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          )
                        : Icon(
                            iconFromName(habit.iconName),
                            color: Colors.white,
                            size: 24,
                          ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      habit.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.22),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '⭐ ${habit.points} pts',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              if (habit.description.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(
                  habit.description,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
              const SizedBox(height: 16),
              // Status pill
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      done
                          ? Icons.check_circle_rounded
                          : Icons.radio_button_unchecked_rounded,
                      color: Colors.white,
                      size: 15,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      done ? 'Completed today! 🎉' : 'Not done yet',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // ── 7-Day streak section ─────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '7-Day Streak',
              style: TextStyle(
                color: AppColors.t1,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.primaryPeach,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${detail.doneCount} / 7 days',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; i < detail.streak.length; i++)
                _StreakDot(
                  day: detail.streak[i],
                  isToday: i == detail.streak.length - 1,
                ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // ── Stats row ─────────────────────────────────────────────────────
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.local_fire_department_rounded,
                label: 'Current Streak',
                value: '${detail.doneCount} days',
                color: AppColors.primary,
                bg: AppColors.primaryPeach,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.star_rounded,
                label: 'Points/Day',
                value: '${habit.points} pts',
                color: AppColors.amber,
                bg: const Color(0xFFFFF3E0),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // ── Action button ─────────────────────────────────────────────────
        SizedBox(
          height: 58,
          child: done
              ? OutlinedButton.icon(
                  onPressed: () =>
                      context.read<CubitHabitDetail>().toggleToday(),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.border, width: 1.5),
                    foregroundColor: AppColors.t2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: const Icon(
                    Icons.remove_done_rounded,
                    size: 20,
                  ),
                  label: const Text(
                    'Mark as not done',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : ElevatedButton.icon(
                  onPressed: () =>
                      context.read<CubitHabitDetail>().toggleToday(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: const Icon(Icons.check_rounded, size: 20),
                  label: const Text(
                    'Mark as done today',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

// ─── Stat card ─────────────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.bg,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final Color bg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
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
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: color,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.t2,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Streak dot ────────────────────────────────────────────────────────────────

class _StreakDot extends StatelessWidget {
  const _StreakDot({required this.day, required this.isToday});

  final EntityStreakDay day;
  final bool isToday;

  static const _weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isToday ? 'Today' : _weekdays[day.date.weekday - 1],
          style: TextStyle(
            color: isToday ? AppColors.primary : AppColors.t2,
            fontSize: 10,
            fontWeight: isToday ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: day.isDone ? AppColors.primary : AppColors.bg,
            border: Border.all(
              color: day.isDone
                  ? AppColors.primary
                  : isToday
                      ? AppColors.primary
                      : AppColors.border,
              width: 1.5,
            ),
          ),
          child: day.isDone
              ? const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 18,
                )
              : null,
        ),
        const SizedBox(height: 8),
        Text(
          '${day.date.day}',
          style: TextStyle(
            color: isToday ? AppColors.t1 : AppColors.t2,
            fontSize: 10,
            fontWeight: isToday ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
