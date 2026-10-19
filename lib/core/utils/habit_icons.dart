/// All icon options available when creating a habit.
/// Each entry has a [codePoint] (Icon data) and a [label].
library;

import 'package:flutter/material.dart';

class HabitIcon {
  const HabitIcon({
    required this.name,
    required this.icon,
    required this.label,
  });

  /// Stored in Firestore as the icon key.
  final String name;
  final IconData icon;
  final String label;
}

const List<HabitIcon> kHabitIcons = [
  HabitIcon(name: 'water',        icon: Icons.water_drop_rounded,            label: 'Water'),
  HabitIcon(name: 'run',          icon: Icons.directions_run_rounded,         label: 'Run'),
  HabitIcon(name: 'book',         icon: Icons.menu_book_rounded,              label: 'Read'),
  HabitIcon(name: 'sleep',        icon: Icons.bedtime_rounded,                label: 'Sleep'),
  HabitIcon(name: 'meditation',   icon: Icons.self_improvement_rounded,       label: 'Meditate'),
  HabitIcon(name: 'gym',          icon: Icons.fitness_center_rounded,         label: 'Gym'),
  HabitIcon(name: 'food',         icon: Icons.restaurant_rounded,             label: 'Diet'),
  HabitIcon(name: 'walk',         icon: Icons.directions_walk_rounded,        label: 'Walk'),
  HabitIcon(name: 'bike',         icon: Icons.directions_bike_rounded,        label: 'Bike'),
  HabitIcon(name: 'code',         icon: Icons.code_rounded,                   label: 'Code'),
  HabitIcon(name: 'music',        icon: Icons.music_note_rounded,             label: 'Music'),
  HabitIcon(name: 'journal',      icon: Icons.edit_note_rounded,              label: 'Journal'),
  HabitIcon(name: 'heart',        icon: Icons.favorite_rounded,               label: 'Health'),
  HabitIcon(name: 'brain',        icon: Icons.psychology_rounded,             label: 'Study'),
  HabitIcon(name: 'money',        icon: Icons.savings_rounded,                label: 'Save'),
  HabitIcon(name: 'clean',        icon: Icons.cleaning_services_rounded,      label: 'Clean'),
  HabitIcon(name: 'nature',       icon: Icons.nature_rounded,                 label: 'Nature'),
  HabitIcon(name: 'social',       icon: Icons.people_rounded,                 label: 'Social'),
  HabitIcon(name: 'yoga',         icon: Icons.accessibility_new_rounded,      label: 'Yoga'),
  HabitIcon(name: 'medication',   icon: Icons.medication_rounded,             label: 'Meds'),
  HabitIcon(name: 'sun',          icon: Icons.wb_sunny_rounded,               label: 'Morning'),
  HabitIcon(name: 'moon',         icon: Icons.nights_stay_rounded,            label: 'Evening'),
  HabitIcon(name: 'phone',        icon: Icons.smartphone_rounded,             label: 'Digital'),
  HabitIcon(name: 'star',         icon: Icons.star_rounded,                   label: 'Goal'),
];

/// Returns the [IconData] for a stored [name], falling back to a checkbox.
IconData iconFromName(String? name) {
  if (name == null || name.isEmpty) return Icons.check_box_outline_blank_rounded;
  return kHabitIcons
      .firstWhere((h) => h.name == name,
          orElse: () => const HabitIcon(
              name: '', icon: Icons.check_box_outline_blank_rounded, label: ''))
      .icon;
}
