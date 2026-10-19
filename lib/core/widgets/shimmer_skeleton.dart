import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

// ─── Shimmer engine ───────────────────────────────────────────────────────────
// ONE AnimationController drives ALL skeleton boxes on screen.
// Uses InheritedWidget so children rebuild in sync without extra controllers.

class ShimmerSkeleton extends StatefulWidget {
  const ShimmerSkeleton({super.key, required this.child});

  final Widget child;

  @override
  State<ShimmerSkeleton> createState() => _ShimmerSkeletonState();
}

class _ShimmerSkeletonState extends State<ShimmerSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) =>
          _ShimmerScope(progress: _ctrl.value, child: widget.child),
    );
  }
}

/// Passes the current shimmer progress down the tree.
class _ShimmerScope extends InheritedWidget {
  const _ShimmerScope({required this.progress, required super.child});

  final double progress;

  static double of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_ShimmerScope>()!.progress;

  @override
  bool updateShouldNotify(_ShimmerScope old) => progress != old.progress;
}

// ─── Skeleton box (the shimmer rectangle) ────────────────────────────────────

class SkeletonBox extends StatelessWidget {
  const SkeletonBox({
    super.key,
    this.width,
    this.height = 16,
    this.borderRadius = 10,
  });

  final double? width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final p = _ShimmerScope.of(context);
    // sweep from left to right
    final x = (p * 4) - 1.5;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment(x - 1, 0),
          end: Alignment(x + 1, 0),
          colors: const [
            Color(0xFFEAEAEA),
            Color(0xFFF5F5F5),
            Color(0xFFFFFFFF),
            Color(0xFFF5F5F5),
            Color(0xFFEAEAEA),
          ],
          stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
        ),
      ),
    );
  }
}

// ─── Today page skeleton ──────────────────────────────────────────────────────

class TodayPageSkeleton extends StatelessWidget {
  const TodayPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerSkeleton(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                const SkeletonBox(width: 40, height: 40, borderRadius: 12),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SkeletonBox(width: 100, height: 12),
                    SizedBox(height: 6),
                    SkeletonBox(width: 160, height: 16),
                  ],
                ),
                const Spacer(),
                const SkeletonBox(width: 40, height: 40, borderRadius: 12),
              ],
            ),
            const SizedBox(height: 24),
            // Banner card
            const SkeletonBox(width: double.infinity, height: 100, borderRadius: 20),
            const SizedBox(height: 16),
            // Progress card
            const SkeletonBox(width: double.infinity, height: 110, borderRadius: 20),
            const SizedBox(height: 28),
            // Section header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SkeletonBox(width: 120, height: 18),
                SkeletonBox(width: 55, height: 14),
              ],
            ),
            const SizedBox(height: 16),
            // Habit cards
            _habitCard(),
            const SizedBox(height: 12),
            _habitCard(),
            const SizedBox(height: 12),
            _habitCard(),
          ],
        ),
      ),
    );
  }

  Widget _habitCard() => const SkeletonBox(
        width: double.infinity,
        height: 72,
        borderRadius: 18,
      );
}

// ─── All Habits page skeleton ─────────────────────────────────────────────────

class AllHabitsPageSkeleton extends StatelessWidget {
  const AllHabitsPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerSkeleton(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 8),
            for (int i = 0; i < 7; i++) ...[
              const SkeletonBox(width: double.infinity, height: 72, borderRadius: 18),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Habit Detail page skeleton ───────────────────────────────────────────────

class HabitDetailSkeleton extends StatelessWidget {
  const HabitDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerSkeleton(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero card
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.primaryPeach,
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(children: [
                    SkeletonBox(width: 44, height: 44, borderRadius: 12),
                    SizedBox(width: 12),
                    SkeletonBox(width: 140, height: 20),
                  ]),
                  SizedBox(height: 12),
                  SkeletonBox(width: double.infinity, height: 14),
                  SizedBox(height: 8),
                  SkeletonBox(width: 200, height: 14),
                ],
              ),
            ),
            const SizedBox(height: 28),
            // Streak header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SkeletonBox(width: 120, height: 18),
                SkeletonBox(width: 80, height: 26, borderRadius: 10),
              ],
            ),
            const SizedBox(height: 14),
            // Streak dots row
            const SkeletonBox(width: double.infinity, height: 90, borderRadius: 20),
            const SizedBox(height: 28),
            // Stats row
            Row(
              children: const [
                Expanded(child: SkeletonBox(height: 90, borderRadius: 16)),
                SizedBox(width: 12),
                Expanded(child: SkeletonBox(height: 90, borderRadius: 16)),
              ],
            ),
            const SizedBox(height: 28),
            // Action button
            const SkeletonBox(width: double.infinity, height: 58, borderRadius: 16),
          ],
        ),
      ),
    );
  }
}
