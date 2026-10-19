import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Disable runtime font fetching — prevents MissingPluginException
  // from google_fonts trying to cache fonts via path_provider.
  GoogleFonts.config.allowRuntimeFetching = false;

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Must be called BEFORE any Firestore reads/writes (and before DI setup).
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );

  configureDependencies();
  runApp(const HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
