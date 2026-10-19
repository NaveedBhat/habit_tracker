# Daily Habit Tracker

A Flutter app to create daily habits, tick them off, earn points and see a
7-day streak per habit. Built with clean architecture on Firebase Firestore.

## Features
- **Today's Habits**: list with tappable done/not-done toggle, points per habit,
  header with points earned and completion count, navigation to Add Habit.
- **Add Habit**: name, description and point value.
- **Habit Detail**: name, description, points, 7-day streak, mark today done/undone.

## Architecture
```
Page (UI) -> Cubit (state) -> UseCase (business logic) -> Repository (interface)
          -> Repository Impl -> Firestore data source
```
| Layer | Folder | Rules followed |
|---|---|---|
| Presentation | `presentation/` | Cubits depend only on UseCases. Pages use `BlocBuilder`/`BlocListener`; `context.read` only in callbacks. |
| Domain | `domain/` | Entities (Freezed), UseCases returning `Either<Failure, T>`, repository interface. No Flutter, Firebase or JSON imports. |
| Data | `data/` | `ModelHabit` + `toEntity()` mapping, Firestore data source, repository impl that wraps every call and never throws. |

Business logic lives in use cases: points/completion totals (`UcGetTodayHabits`),
input validation (`UcAddHabit`), 7-day streak window (`UcGetHabitDetail`).

## Stack
`flutter_bloc` · `freezed` · `dartz` · `get_it` · `go_router` · `cloud_firestore`

## Firestore data model
```
habits/{habitId}                    name, description, points, createdAt
completions/{habitId}_{yyyy-MM-dd}  habitId, dateKey, completedAt
```
A completion document exists only while a habit is marked done for that day.
No composite indexes are needed.

## Setup
1. Create a Firebase project and a Firestore database (test mode, or use `firestore.rules` for the demo).
2. Install the CLI and link the app (this generates `lib/firebase_options.dart`):
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```
3. Install and generate code:
   ```bash
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   ```
4. Run: `flutter run`

Android needs `minSdkVersion 23` and iOS a deployment target of 13 or higher for the Firebase plugins.
