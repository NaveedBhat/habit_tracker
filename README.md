<div align="center">

<img src="assets/daily-tracker.png" width="140" alt="Habit Tracker App Icon" />

# Habit Tracker

### Build Better Habits — One Day at a Time

*A production-grade Flutter app with Clean Architecture, Firebase Firestore, BLoC state management, and a premium UI.*

![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen?style=flat-square)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-blue?style=flat-square&logo=flutter)
![Language](https://img.shields.io/badge/Language-Dart%203.6-0553B1?style=flat-square&logo=dart)
![Firebase](https://img.shields.io/badge/Backend-Firebase%20Firestore-FF6F00?style=flat-square&logo=firebase)
![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-purple?style=flat-square)
![Author](https://img.shields.io/badge/Author-Naveed%20Bhat-orange?style=flat-square)

![topic](https://img.shields.io/badge/topic-Flutter-02569B?style=flat-square)
![topic](https://img.shields.io/badge/topic-BLoC%20Pattern-8E24AA?style=flat-square)
![topic](https://img.shields.io/badge/topic-Clean%20Architecture-1565C0?style=flat-square)
![topic](https://img.shields.io/badge/topic-Firebase-FF6F00?style=flat-square)
![topic](https://img.shields.io/badge/topic-Freezed-00897B?style=flat-square)
![topic](https://img.shields.io/badge/topic-Notifications-E53935?style=flat-square)

</div>

---

## Overview

**Habit Tracker** is a **production-ready Flutter application** built with strict **Clean Architecture** principles and **Firebase Firestore** as the real-time backend. Users can create daily habits, track completions, earn points, visualize 7-day streaks, set daily push notifications, and see all progress at a glance — with everything synced to the cloud and available offline.

---

## ✅ Assignment Requirements Coverage

Every item from the Phase 2 specification is implemented and verifiable.

### Screen 1 — Today's Habits
| Requirement | Status |
|---|---|
| List of today's habits | ✅ Done |
| Habit name, done/undone status toggle (tappable) | ✅ Done |
| Points value displayed per habit | ✅ Done |
| Progress header — total points earned + completion count | ✅ Done |
| Navigation to Add Habit screen | ✅ Done (FAB button) |

### Screen 2 — Add Habit
| Requirement | Status |
|---|---|
| Form with name, description, and point value | ✅ Done |
| Data saved to Firebase Firestore (no mock/hardcoded data) | ✅ Done |

### Screen 3 — Habit Detail
| Requirement | Status |
|---|---|
| Shows habit name, description, and point value | ✅ Done |
| 7-day streak visualization | ✅ Done |
| Toggle today as done / undone | ✅ Done |

### Required Packages
| Package | Status |
|---|---|
| `flutter_bloc` | ✅ |
| `freezed` | ✅ |
| `dartz` | ✅ |
| `get_it` | ✅ |
| `go_router` | ✅ |
| `cloud_firestore` | ✅ |
| Clean Architecture (domain / data / presentation) | ✅ |

---

## ✨ Features

| Screen | Features |
|---|---|
| **Today** | Time-based greeting (morning/afternoon/evening/night icon), progress ring, daily challenge card, habit list with toggle, swipe-to-delete, pull-to-refresh |
| **Add Habit** | Name, description, points, duration (minutes), optional icon picker (24 icons), form validation, animated success toast with habit name |
| **Habit Detail** | Hero card with gradient + waves texture, 7-day streak chart, stats (points, streak, completion), toggle done/undone, delete |
| **See All Habits** | Complete habit list with points + duration badge, swipe-to-delete |
| **Notifications** | Enable/disable daily reminder toggle, time picker, system permission request, persistent via SharedPreferences |

### Feature Highlights

- 🌅 **Time-of-Day Greeting** — icon and message auto-changes: ☀️ Morning / 🌤️ Afternoon / 🌆 Evening / 🌙 Night
- 🔔 **Daily Push Notifications** — timezone-aware scheduled reminder via `flutter_local_notifications`
- 🎉 **Animated Toast** — slides in from bottom with habit name: *"Drink Water" added successfully!*
- ⚡ **Optimistic UI** — toggles and deletes update instantly; reverts on Firestore error
- 📶 **Offline Support** — Firestore persistence + unlimited cache; works without internet
- 🎯 **Progress Ring** — animated circular indicator with real-time points earned
- 🗂️ **Batch Delete** — deletes habit document + all completion records atomically in one Firestore batch
- 🌊 **Waves Texture** — `DecorationImage` with `BoxFit.cover` fills cards edge-to-edge perfectly
- 🔍 **Zero Lint Warnings** — `dart analyze` returns `No issues found!`

---

## Architecture

This project follows **Clean Architecture** with strict layer separation. The domain layer contains **zero Flutter or Firebase imports** — it is pure Dart.

```
lib/
├── core/
│   ├── di/               # GetIt dependency injection
│   ├── error/            # Failures & Exceptions (Either<Failure, T>)
│   ├── router/           # GoRouter declarative navigation
│   ├── services/         # NotificationService (singleton)
│   ├── theme/            # AppColors, AppTheme
│   ├── usecases/         # UseCase base class + NoParams
│   ├── utils/            # date_helpers, habit_icons, view_status
│   └── widgets/          # BlobDecoration, ShimmerSkeleton
│
└── features/
    └── habits/
        ├── domain/           ← Pure Dart, no Flutter/Firebase
        │   ├── entities/     # EntityHabit, EntityHabitDetail, EntityStreakDay …
        │   ├── repositories/ # RepositoryHabit (abstract interface)
        │   └── usecases/     # UcGetTodayHabits, UcAddHabit, UcToggleHabit …
        │
        ├── data/             ← Firebase lives here only
        │   ├── datasources/  # HabitRemoteDataSource (Firestore)
        │   ├── models/       # ModelHabit (fromDoc / toEntity)
        │   └── repositories/ # ImplHabitRepository (_guard error wrapper)
        │
        └── presentation/     ← Flutter UI
            ├── cubit/        # CubitTodayHabits, CubitAddHabit, CubitHabitDetail, CubitAllHabits
            └── pages/        # PageToday, PageAddHabit, PageHabitDetail, PageAllHabits, PageNotifications
```

### Data Flow

```
UI (Page)
  └─► Cubit (BLoC)
        └─► UseCase (domain)
              └─► Repository Interface (domain)
                    └─► ImplHabitRepository (data)
                          └─► HabitRemoteDataSource
                                └─► Firebase Firestore
```

---

## Firestore Schema

```
habits/{habitId}
  ├── name            : String
  ├── description     : String
  ├── points          : Number
  ├── iconName        : String     (e.g. "water", "book" — empty = letter avatar)
  ├── durationMinutes : Number
  └── createdAt       : Timestamp

completions/{habitId}_{yyyy-MM-dd}
  ├── habitId         : String
  ├── dateKey         : String     (e.g. "2026-10-19")
  └── completedAt     : Timestamp
```

> **Delete habit** → batch-deletes `habits/{id}` **and** all `completions/{id}_*` atomically in one Firestore write operation.

---

## Use Cases

| Use Case | Responsibility |
|---|---|
| `UcGetTodayHabits` | Fetch all habits + today's completions in parallel (`Future.wait`) |
| `UcGetAllHabits` | Fetch all habits (no completion data) |
| `UcAddHabit` | Validate and create a new habit in Firestore |
| `UcToggleHabit` | Mark a habit done/undone for today |
| `UcDeleteHabit` | Delete habit + all completion history atomically (batch) |
| `UcGetHabitDetail` | Fetch habit + 7-day streak completion flags in parallel |

---

## Tech Stack

| Package | Version | Purpose |
|---|---|---|
| `flutter_bloc` | ^8.1.6 | Cubit-based state management |
| `freezed` / `freezed_annotation` | ^3.0.0 | Immutable models & states |
| `dartz` | ^0.10.1 | `Either<Failure, T>` functional error handling |
| `get_it` | ^7.7.0 | Service locator / dependency injection |
| `go_router` | ^14.2.0 | Declarative navigation |
| `cloud_firestore` | ^5.4.0 | Real-time NoSQL backend |
| `firebase_core` | ^3.4.0 | Firebase initialization |
| `flutter_local_notifications` | ^18.0.0 | Scheduled daily push notifications |
| `timezone` | ^0.9.4 | Timezone-aware notification scheduling |
| `shared_preferences` | ^2.3.0 | Persisting notification settings |
| `google_fonts` | ^6.2.1 | Premium typography (Outfit) |
| `path_provider` | ^2.1.4 | Required by google_fonts |

---

## Getting Started

### Prerequisites

- Flutter `>=3.6.0`
- Dart `>=3.6.0`
- A Firebase project with **Firestore** enabled

### Setup

**1. Clone the repository**
```bash
git clone https://github.com/NaveedBhat/habit_tracker.git
cd habit_tracker
```

**2. Add Firebase configuration**

The Firebase config files are excluded from the repo for security. Add your own:

- Android → place `google-services.json` in `android/app/`
- iOS → place `GoogleService-Info.plist` in `ios/Runner/`

Use the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli) to generate these:
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

**3. Install dependencies**
```bash
flutter pub get
```

**4. Run the app**
```bash
flutter run
```

---

## Code Quality

```bash
dart analyze lib/
# Analyzing lib...
# No issues found!
```

- ✅ All `AnimationController`s properly `dispose()`d
- ✅ All async methods check `!mounted` before `setState()`
- ✅ All cubits check `isClosed` before `emit()` post-await
- ✅ All repository calls wrapped in `_guard()` — UI never receives a thrown exception
- ✅ Zero deprecated API usage
- ✅ Zero dead code


## Project Highlights

- **Optimistic UI** — toggles and deletes update instantly; if Firestore fails, state is reverted and an error is shown
- **Parallel Firestore fetches** — `Future.wait([getHabits(), getCompletedIds()])` halves cold-start latency  
- **Offline persistence** — `Settings(persistenceEnabled: true, cacheSizeBytes: CACHE_SIZE_UNLIMITED)` — app works without internet
- **Architecture purity** — domain layer verified to have zero Flutter/Firebase imports
- **Timezone-aware notifications** — daily reminders scheduled using the device's local timezone, rolls over to next day if time has passed
- **Premium toast system** — overlay-based animated toast with slide + fade, auto-dismisses, closeable manually

---

## License

This project is for evaluation/assignment purposes.

---

<div align="center">

Built with ❤️ by **Naveed Bhat**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin)](https://linkedin.com/in/naveedbhat)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github)](https://github.com/NaveedBhat)

</div>
