import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/habit_icons.dart';
import '../../../../core/utils/view_status.dart';
import '../../../../core/widgets/blob_decoration.dart';
import '../cubit/cubit_add_habit.dart';
import '../cubit/state_add_habit.dart';

class PageAddHabit extends StatefulWidget {
  const PageAddHabit({super.key});

  @override
  State<PageAddHabit> createState() => _PageAddHabitState();
}

class _PageAddHabitState extends State<PageAddHabit> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _pointsController = TextEditingController(text: '10');

  String _selectedIcon = '';
  int _durationMinutes = 5; // user-selected duration

  static const List<int> _durationOptions = [
    2, 5, 10, 15, 20, 30, 45, 60
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _pointsController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<CubitAddHabit>().submit(
          name: _nameController.text.trim(),
          description: _descriptionController.text.trim(),
          points: int.tryParse(_pointsController.text.trim()) ?? 0,
          iconName: _selectedIcon,
          durationMinutes: _durationMinutes,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitAddHabit, StateAddHabit>(
      listener: (context, state) {
        if (state.status == ViewStatus.success) {
          context.pop();
        } else if (state.status == ViewStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Failed to save')),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.status == ViewStatus.loading;

        return Scaffold(
          backgroundColor: AppColors.bg,
          body: Stack(
            children: [
              // Decorative top-right blob
              Positioned(
                top: -60,
                right: -50,
                child: BlobDecoration(size: 260, color: AppColors.lavender),
              ),
              SafeArea(
                child: Column(
                  children: [
                    // Custom AppBar
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
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
                            'New Habit',
                            style: TextStyle(
                              color: AppColors.t1,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Form content
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          children: [
                            // Top gradient hint card
                            Container(
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [AppColors.primary, Color(0xFFFF8C5A)],
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withValues(alpha: 0.3),
                                    blurRadius: 16,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: const Icon(Icons.add_task_rounded,
                                        color: Colors.white, size: 26),
                                  ),
                                  const SizedBox(width: 14),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Build a new habit',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          'Small steps lead to big changes 🚀',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // ── Icon Picker ──────────────────────────────────
                            const _FieldLabel('Choose an Icon'),
                            const SizedBox(height: 10),
                            _IconPicker(
                              selected: _selectedIcon,
                              onChanged: (name) =>
                                  setState(() => _selectedIcon = name),
                            ),
                            const SizedBox(height: 20),

                            // ── Habit Name ───────────────────────────────────
                            const _FieldLabel('Habit Name'),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _nameController,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                  color: AppColors.t1, fontSize: 15),
                              decoration: _inputDecoration(
                                hint: 'e.g. Drink 2L water, Read 20 pages',
                                prefixIcon: _selectedIcon.isEmpty
                                    ? null
                                    : Icon(
                                        iconFromName(_selectedIcon),
                                        color: AppColors.primary,
                                        size: 22,
                                      ),
                              ),
                              validator: (v) =>
                                  (v == null || v.trim().isEmpty)
                                      ? 'Please enter a name'
                                      : null,
                            ),
                            const SizedBox(height: 20),

                            // ── Description ──────────────────────────────────
                            const _FieldLabel('Description (optional)'),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _descriptionController,
                              maxLines: 3,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                  color: AppColors.t1, fontSize: 15),
                              decoration: _inputDecoration(
                                hint: 'Add context, goal, or instructions...',
                              ),
                            ),
                            const SizedBox(height: 20),

                            // ── Points ───────────────────────────────────────
                            const _FieldLabel('Points Value'),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _pointsController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: const TextStyle(
                                  color: AppColors.t1, fontSize: 15),
                              decoration: _inputDecoration(
                                hint: '10',
                                prefixIcon: const Icon(Icons.star_rounded,
                                    color: AppColors.amber, size: 22),
                                helperText:
                                    'Points rewarded each time you complete this habit',
                              ),
                              validator: (v) {
                                final value =
                                    int.tryParse((v ?? '').trim());
                                if (value == null || value <= 0) {
                                  return 'Enter a number greater than 0';
                                }
                                if (value > 1000) return 'Max 1000 points';
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),

                            // ── Duration ──────────────────────────────────────
                            const _FieldLabel('Duration (Minutes)'),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 44,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: _durationOptions.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: 8),
                                itemBuilder: (_, i) {
                                  final mins = _durationOptions[i];
                                  final selected = mins == _durationMinutes;
                                  return GestureDetector(
                                    onTap: () => setState(
                                        () => _durationMinutes = mins),
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: selected
                                            ? AppColors.primary
                                            : AppColors.surface,
                                        borderRadius:
                                            BorderRadius.circular(22),
                                        border: Border.all(
                                          color: selected
                                              ? AppColors.primary
                                              : AppColors.border,
                                          width: selected ? 0 : 1,
                                        ),
                                      ),
                                      child: Text(
                                        '$mins min',
                                        style: TextStyle(
                                          color: selected
                                              ? Colors.white
                                              : AppColors.t2,
                                          fontSize: 13,
                                          fontWeight: selected
                                              ? FontWeight.w700
                                              : FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 32),

                            // ── Submit ───────────────────────────────────────
                            SizedBox(
                              height: 56,
                              child: ElevatedButton(
                                onPressed: isLoading ? null : _submit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  disabledBackgroundColor:
                                      AppColors.primary.withValues(alpha: 0.5),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: isLoading
                                    ? const SizedBox(
                                        height: 22,
                                        width: 22,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.5,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.check_rounded,
                                              color: Colors.white, size: 20),
                                          SizedBox(width: 8),
                                          Text(
                                            'Save Habit',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    Widget? prefixIcon,
    String? helperText,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: prefixIcon,
      helperText: helperText,
      helperStyle: const TextStyle(color: AppColors.t2, fontSize: 12),
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
    );
  }
}

// ─── Icon Picker ──────────────────────────────────────────────────────────────

class _IconPicker extends StatelessWidget {
  const _IconPicker({required this.selected, required this.onChanged});

  final String selected;
  final ValueChanged<String> onChanged;

  // Total items = None tile + all icons
  static const int _noneIndex = 0;

  @override
  Widget build(BuildContext context) {
    final totalCount = kHabitIcons.length + 1; // +1 for "None"

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: totalCount,
        itemBuilder: (_, i) {
          // ── "None" tile ──────────────────────────────────
          if (i == _noneIndex) {
            final isSelected = selected.isEmpty;
            return GestureDetector(
              onTap: () => onChanged(''),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.t1 : AppColors.bg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? AppColors.t1 : AppColors.border,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Icon(
                  Icons.block_rounded,
                  color: isSelected ? Colors.white : AppColors.t3,
                  size: 20,
                ),
              ),
            );
          }

          // ── Regular icon tile ─────────────────────────────
          final h = kHabitIcons[i - 1];
          final isSelected = h.name == selected;
          return GestureDetector(
            onTap: () => onChanged(h.name),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.bg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.border,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Icon(
                h.icon,
                color: isSelected ? Colors.white : AppColors.t2,
                size: 22,
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── Field label ──────────────────────────────────────────────────────────────

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.t1,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
