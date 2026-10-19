import 'package:flutter/material.dart';

import '../../../../core/services/notification_service.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/blob_decoration.dart';

class PageNotifications extends StatefulWidget {
  const PageNotifications({super.key});

  @override
  State<PageNotifications> createState() => _PageNotificationsState();
}

class _PageNotificationsState extends State<PageNotifications>
    with SingleTickerProviderStateMixin {
  bool _enabled = false;
  TimeOfDay _time = const TimeOfDay(hour: 8, minute: 0);
  bool _loading = true;
  bool _saving = false;

  late final AnimationController _fadeCtrl;
  late final Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _fadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnim = CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeOut);
    _loadPrefs();
  }

  @override
  void dispose() {
    _fadeCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadPrefs() async {
    final enabled = await NotificationService.instance.isEnabled();
    final time = await NotificationService.instance.getReminderTime();
    if (!mounted) return;
    setState(() {
      _enabled = enabled;
      _time = time;
      _loading = false;
    });
    _fadeCtrl.forward();
  }

  Future<void> _toggleEnabled(bool val) async {
    setState(() => _saving = true);
    final granted = val
        ? await NotificationService.instance.requestPermission()
        : true;
    if (!mounted) return;
    if (val && !granted) {
      setState(() => _saving = false);
      _showSnack('Permission denied — enable notifications in system settings');
      return;
    }
    await NotificationService.instance.setEnabled(enabled: val, time: _time);
    if (!mounted) return;
    setState(() {
      _enabled = val;
      _saving = false;
    });
    _showSnack(
      val
          ? '🔔 Daily reminder set for ${_time.format(context)}'
          : '🔕 Notifications disabled',
    );
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _time,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primary,
            onPrimary: Colors.white,
            surface: Colors.white,
          ),
        ),
        child: child!,
      ),
    );
    if (picked == null || !mounted) return;
    setState(() => _time = picked);
    if (_enabled) {
      setState(() => _saving = true);
      await NotificationService.instance.scheduleDailyReminder(picked);
      if (!mounted) return;
      setState(() => _saving = false);
      _showSnack('⏰ Reminder updated to ${picked.format(context)}');
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.t1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  // ── build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          // Decorative blob
          const Positioned(
            top: -60,
            right: -50,
            child: BlobDecoration(size: 260, color: AppColors.lavender),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Custom AppBar ──────────────────────────────────────────
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      _BackButton(),
                      const SizedBox(width: 12),
                      const Text(
                        'Notifications',
                        style: TextStyle(
                          color: AppColors.t1,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      if (_saving) ...[
                        const Spacer(),
                        const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    ],
                  ),
                ),

                // ── Body ───────────────────────────────────────────────────
                Expanded(
                  child: _loading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                            strokeWidth: 2,
                          ),
                        )
                      : FadeTransition(
                          opacity: _fadeAnim,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ── Hero banner ─────────────────────────
                                _HeroBanner(enabled: _enabled),
                                const SizedBox(height: 28),

                                // ── Section: Daily reminder ─────────────
                                const _SectionLabel('Daily Reminder'),
                                const SizedBox(height: 12),
                                _MainToggleCard(
                                  enabled: _enabled,
                                  onChanged:
                                      _saving ? null : _toggleEnabled,
                                ),
                                const SizedBox(height: 12),

                                // ── Time picker card (only when enabled) ─
                                AnimatedSwitcher(
                                  duration:
                                      const Duration(milliseconds: 280),
                                  transitionBuilder: (child, anim) =>
                                      FadeTransition(
                                    opacity: anim,
                                    child: SizeTransition(
                                      sizeFactor: anim,
                                      axisAlignment: -1,
                                      child: child,
                                    ),
                                  ),
                                  child: _enabled
                                      ? _TimePickerCard(
                                          key: const ValueKey('tp'),
                                          time: _time,
                                          onTap: _pickTime,
                                        )
                                      : const SizedBox.shrink(
                                          key: ValueKey('empty'),
                                        ),
                                ),
                                const SizedBox(height: 28),

                                // ── Section: How it works ───────────────
                                const _SectionLabel('How It Works'),
                                const SizedBox(height: 12),
                                _InfoCard(),
                                const SizedBox(height: 28),

                                // ── Tips ────────────────────────────────
                                const _SectionLabel('Tips'),
                                const SizedBox(height: 12),
                                const _TipCard(
                                  icon: Icons.wb_sunny_rounded,
                                  color: AppColors.amber,
                                  bg: Color(0xFFFFF3E0),
                                  title: 'Morning kickstart',
                                  body:
                                      'Set your reminder early (7–9 AM) to build a winning morning routine.',
                                ),
                                const SizedBox(height: 10),
                                const _TipCard(
                                  icon: Icons.nights_stay_rounded,
                                  color: AppColors.lavender,
                                  bg: Color(0xFFF3F0FF),
                                  title: 'Evening review',
                                  body:
                                      'Set a reminder in the evening (8–9 PM) to review and complete remaining habits.',
                                ),
                                const SizedBox(height: 10),
                                const _TipCard(
                                  icon: Icons.local_fire_department_rounded,
                                  color: AppColors.primary,
                                  bg: AppColors.primaryPeach,
                                  title: 'Stay consistent',
                                  body:
                                      'The same time every day builds a powerful habit loop — your brain will start expecting it.',
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Back button ──────────────────────────────────────────────────────────────

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}

// ─── Hero banner ──────────────────────────────────────────────────────────────

class _HeroBanner extends StatelessWidget {
  const _HeroBanner({required this.enabled});
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: enabled
              ? [AppColors.primary, const Color(0xFFFF8C69)]
              : [AppColors.t3, AppColors.t2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: (enabled ? AppColors.primary : AppColors.t2)
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
                  enabled
                      ? '🔔 Reminders On'
                      : '🔕 Reminders Off',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  enabled
                      ? "You'll get a daily nudge to build your streaks."
                      : 'Turn on reminders to stay on track every day.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              enabled
                  ? Icons.notifications_active_rounded
                  : Icons.notifications_off_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Section label ────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.t1,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

// ─── Main toggle card ─────────────────────────────────────────────────────────

class _MainToggleCard extends StatelessWidget {
  const _MainToggleCard({required this.enabled, required this.onChanged});

  final bool enabled;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: enabled ? AppColors.primaryPeach : const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              Icons.notifications_rounded,
              color: enabled ? AppColors.primary : AppColors.t3,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daily Habit Reminder',
                  style: TextStyle(
                    color: AppColors.t1,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  enabled ? 'Tap the clock to change time' : 'Off',
                  style: const TextStyle(color: AppColors.t2, fontSize: 12),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: enabled,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

// ─── Time picker card ─────────────────────────────────────────────────────────

class _TimePickerCard extends StatelessWidget {
  const _TimePickerCard({super.key, required this.time, required this.onTap});

  final TimeOfDay time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primaryPeach,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.access_time_rounded,
                color: AppColors.primary,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reminder Time',
                    style: TextStyle(
                      color: AppColors.t2,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    time.format(context),
                    style: const TextStyle(
                      color: AppColors.t1,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryPeach,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Change',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Info card ────────────────────────────────────────────────────────────────

class _InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const items = [
      (Icons.check_circle_outline_rounded, 'Enable the daily reminder toggle'),
      (Icons.access_alarm_rounded, 'Pick your preferred time'),
      (Icons.phone_android_rounded, "We'll notify you every day at that time"),
      (Icons.edit_notifications_rounded,
          'You can change the time anytime here'),
    ];

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primaryPeach,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${i + 1}',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    items[i].$2,
                    style: const TextStyle(
                      color: AppColors.t1,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
            if (i < items.length - 1)
              const Padding(
                padding: EdgeInsets.only(left: 44, top: 4, bottom: 4),
                child: Divider(color: AppColors.border, height: 1),
              ),
          ],
        ],
      ),
    );
  }
}

// ─── Tip card ─────────────────────────────────────────────────────────────────

class _TipCard extends StatelessWidget {
  const _TipCard({
    required this.icon,
    required this.color,
    required this.bg,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final Color color;
  final Color bg;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration:
                BoxDecoration(color: bg, borderRadius: BorderRadius.circular(13)),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.t1,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: const TextStyle(
                    color: AppColors.t2,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
