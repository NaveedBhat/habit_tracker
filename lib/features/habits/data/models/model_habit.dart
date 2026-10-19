import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/entity_habit.dart';

class ModelHabit {
  const ModelHabit({
    required this.id,
    required this.name,
    required this.description,
    required this.points,
    required this.createdAt,
    required this.iconName,
  });

  final String id;
  final String name;
  final String description;
  final int points;
  final DateTime createdAt;
  final String iconName;

  factory ModelHabit.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? <String, dynamic>{};
    return ModelHabit(
      id: doc.id,
      name: (data['name'] as String?) ?? '',
      description: (data['description'] as String?) ?? '',
      points: (data['points'] as num?)?.toInt() ?? 0,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      iconName: (data['iconName'] as String?) ?? '',
    );
  }
}

/// Model -> Entity mapping lives here, in the data layer only.
extension ModelHabitX on ModelHabit {
  EntityHabit toEntity() => EntityHabit(
        id: id,
        name: name,
        description: description,
        points: points,
        createdAt: createdAt,
        iconName: iconName,
      );
}
