import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Keys stored in SharedPreferences
const _kEnabled = 'notif_enabled';
const _kHour = 'notif_hour';
const _kMinute = 'notif_minute';

const int _dailyId = 1;

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  // ── Init ────────────────────────────────────────────────────────────────────

  Future<void> init() async {
    if (_initialized) return;
    tz.initializeTimeZones();

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      const InitializationSettings(android: android, iOS: ios),
    );
    _initialized = true;
  }

  // ── Permission ──────────────────────────────────────────────────────────────

  Future<bool> requestPermission() async {
    final android = _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      final granted = await android.requestNotificationsPermission();
      return granted ?? false;
    }
    final ios = _plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();
    if (ios != null) {
      final granted = await ios.requestPermissions(alert: true, sound: true, badge: true);
      return granted ?? false;
    }
    return false;
  }

  // ── Prefs ───────────────────────────────────────────────────────────────────

  Future<bool> isEnabled() async {
    final p = await SharedPreferences.getInstance();
    return p.getBool(_kEnabled) ?? false;
  }

  Future<TimeOfDay> getReminderTime() async {
    final p = await SharedPreferences.getInstance();
    return TimeOfDay(
      hour: p.getInt(_kHour) ?? 8,
      minute: p.getInt(_kMinute) ?? 0,
    );
  }

  Future<void> _savePrefs({required bool enabled, required TimeOfDay time}) async {
    final p = await SharedPreferences.getInstance();
    await p.setBool(_kEnabled, enabled);
    await p.setInt(_kHour, time.hour);
    await p.setInt(_kMinute, time.minute);
  }

  // ── Schedule / Cancel ───────────────────────────────────────────────────────

  Future<void> scheduleDailyReminder(TimeOfDay time) async {
    await _plugin.cancel(_dailyId);

    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    await _plugin.zonedSchedule(
      _dailyId,
      '🌟 Habit Reminder',
      "Don't forget to complete today's habits and earn your points!",
      scheduled,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'habit_daily',
          'Daily Reminder',
          channelDescription: 'Daily habit check-in reminder',
          importance: Importance.high,
          priority: Priority.high,
          styleInformation: BigTextStyleInformation(
            "Don't forget to complete today's habits and earn your points!",
          ),
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentSound: true,
          presentBadge: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    await _savePrefs(enabled: true, time: time);
  }

  Future<void> cancelAll() async {
    await _plugin.cancel(_dailyId);
    final p = await SharedPreferences.getInstance();
    await p.setBool(_kEnabled, false);
  }

  /// Schedule or cancel based on [enabled].
  Future<void> setEnabled({required bool enabled, required TimeOfDay time}) async {
    if (enabled) {
      await scheduleDailyReminder(time);
    } else {
      await cancelAll();
      await _savePrefs(enabled: false, time: time);
    }
  }
}
