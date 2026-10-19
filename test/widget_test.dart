import 'package:flutter_test/flutter_test.dart';
import 'package:habit_tracker/core/utils/date_helpers.dart';
import 'package:habit_tracker/features/habits/domain/entities/entity_habit.dart';
import 'package:habit_tracker/features/habits/domain/entities/entity_habit_status.dart';
import 'package:habit_tracker/features/habits/domain/entities/entity_streak_day.dart';
import 'package:habit_tracker/features/habits/domain/entities/entity_today_summary.dart';

void main() {
  group('Habit Tracker Domain & Helpers', () {
    test('dateOnly strips hours, minutes, and seconds', () {
      final now = DateTime(2026, 10, 19, 15, 30, 45);
      final stripped = dateOnly(now);
      expect(stripped.year, 2026);
      expect(stripped.month, 10);
      expect(stripped.day, 19);
      expect(stripped.hour, 0);
      expect(stripped.minute, 0);
      expect(stripped.second, 0);
    });

    test('toDateKey formats YYYY-MM-DD properly', () {
      final date = DateTime(2026, 3, 5);
      expect(toDateKey(date), '2026-03-05');
    });

    test('EntityHabit instantiates correctly with values', () {
      final habit = EntityHabit(
        id: 'habit-1',
        name: 'Drink 2L water',
        description: 'Stay hydrated',
        points: 15,
        createdAt: DateTime(2026, 10, 19),
      );

      expect(habit.id, 'habit-1');
      expect(habit.name, 'Drink 2L water');
      expect(habit.points, 15);
    });

    test('EntityTodaySummary calculates completion and points', () {
      final habit1 = EntityHabit(
        id: '1',
        name: 'Read book',
        description: '',
        points: 20,
        createdAt: DateTime(2026, 10, 19),
      );
      final habit2 = EntityHabit(
        id: '2',
        name: 'Workout',
        description: '',
        points: 30,
        createdAt: DateTime(2026, 10, 19),
      );

      final summary = EntityTodaySummary(
        earnedPoints: 20,
        totalPoints: 50,
        completedCount: 1,
        totalCount: 2,
        items: [
          EntityHabitStatus(habit: habit1, isDone: true),
          EntityHabitStatus(habit: habit2, isDone: false),
        ],
      );

      expect(summary.earnedPoints, 20);
      expect(summary.totalPoints, 50);
      expect(summary.completedCount, 1);
      expect(summary.totalCount, 2);
      expect(summary.items.length, 2);
    });

    test('EntityStreakDay holds status and date', () {
      final streakDay = EntityStreakDay(
        date: DateTime(2026, 10, 19),
        isDone: true,
      );

      expect(streakDay.isDone, isTrue);
      expect(streakDay.date.day, 19);
    });
  });
}
