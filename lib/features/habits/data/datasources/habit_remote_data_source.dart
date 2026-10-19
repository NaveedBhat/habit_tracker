import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/date_helpers.dart';
import '../models/model_habit.dart';

/// Firestore layout:
///   habits/{habitId}                   -> name, description, points, iconName, createdAt
///   completions/{habitId}_{yyyy-MM-dd} -> habitId, dateKey, completedAt
class HabitRemoteDataSource {
  HabitRemoteDataSource(this._db);

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _habits =>
      _db.collection('habits');
  CollectionReference<Map<String, dynamic>> get _completions =>
      _db.collection('completions');

  String _completionId(String habitId, DateTime date) =>
      '${habitId}_${toDateKey(date)}';

  Future<List<ModelHabit>> getHabits() async {
    final snap = await _habits.orderBy('createdAt').get();
    return snap.docs.map(ModelHabit.fromDoc).toList();
  }

  Future<ModelHabit> getHabit(String habitId) async {
    final doc = await _habits.doc(habitId).get();
    if (!doc.exists) throw const NotFoundException('Habit not found');
    return ModelHabit.fromDoc(doc);
  }

  Future<ModelHabit> addHabit({
    required String name,
    required String description,
    required int points,
    required String iconName,
  }) async {
    final ref = await _habits.add({
      'name': name,
      'description': description,
      'points': points,
      'iconName': iconName,
      'createdAt': FieldValue.serverTimestamp(),
    });
    final doc = await ref.get();
    return ModelHabit.fromDoc(doc);
  }

  /// Deletes the habit document AND all its completion records atomically.
  Future<void> deleteHabit(String habitId) async {
    final completionSnap = await _completions
        .where('habitId', isEqualTo: habitId)
        .get();

    final batch = _db.batch();
    batch.delete(_habits.doc(habitId));
    for (final doc in completionSnap.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }

  Future<Set<String>> getCompletedHabitIds(DateTime date) async {
    final snap =
        await _completions.where('dateKey', isEqualTo: toDateKey(date)).get();
    return snap.docs.map((d) => d.data()['habitId'] as String).toSet();
  }

  /// Fetches habits + today's completions in parallel for fast cold start.
  Future<(List<ModelHabit>, Set<String>)> getHabitsWithCompletions(
      DateTime date) async {
    final results = await Future.wait([
      getHabits(),
      getCompletedHabitIds(date),
    ]);
    return (results[0] as List<ModelHabit>, results[1] as Set<String>);
  }

  Future<List<bool>> getCompletionFlags(
    String habitId,
    List<DateTime> days,
  ) async {
    // Parallel fetch all 7 days at once
    final docs = await Future.wait(
      days.map((d) => _completions.doc(_completionId(habitId, d)).get()),
    );
    return docs.map((d) => d.exists).toList();
  }

  Future<void> setCompletion({
    required String habitId,
    required DateTime date,
    required bool isDone,
  }) async {
    final ref = _completions.doc(_completionId(habitId, date));
    if (isDone) {
      await ref.set({
        'habitId': habitId,
        'dateKey': toDateKey(date),
        'completedAt': FieldValue.serverTimestamp(),
      });
    } else {
      await ref.delete();
    }
  }
}
