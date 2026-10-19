# Vibe Coding Walkthrough — Daily Habit Tracker

> **Video Script / Talking Points** — 2 to 3 minutes

---

## 🎬 Intro (15 sec)

> *"Hey — I'll walk you through how I used AI tools to build the Daily Habit Tracker, the prompts I used, where I had to push back on the AI, and how I made sure the output actually followed clean architecture."*

---

## 🤖 AI Tool Used (15 sec)

I used **ChatGPT (GPT-4o)** and **Cursor** throughout this project.

Cursor was used for in-editor completions and refactoring.
ChatGPT was used for architectural decisions, debugging, and generating boilerplate.

---

## 💬 Prompt Examples (60 sec)

### Prompt 1 — Project Scaffold

> *"Build a Flutter habit tracker with clean architecture — strict domain / data / presentation separation. Use flutter_bloc Cubits, freezed entities, dartz Either for error handling, get_it for DI, go_router for navigation, and Firebase Firestore as the only data source. Zero mock data anywhere."*

**What it gave me:** Full folder structure, base classes, the repository interface, and all use cases wired up correctly on first attempt.

---

### Prompt 2 — Swipe to Delete with Batch Firestore

> *"Add swipe-left to delete on the Today page using Flutter's Dismissible widget. Optimistically remove the item from the UI immediately, show a red delete background, and if the user confirms — delete the habit document AND all its completion records in a single Firestore batch write so there are no orphaned documents."*

**What it gave me:** `Dismissible` implementation, the confirmation dialog, and the batch delete in `HabitRemoteDataSource` — all correct.

---

### Prompt 3 — 7-Day Streak UI

> *"In the Habit Detail screen, show a 7-day streak row — the last 7 days as day-letter bubbles (M T W T F S S). Each bubble should be filled/green if the habit was completed that day, and grey if not. Fetch all 7 days in parallel using Future.wait to minimise latency."*

**What it gave me:** Parallel fetch with `Future.wait`, `EntityStreakDay` entity, and the bubble UI — matched exactly what I had in mind.

---

## 🛠️ Where I Corrected the AI (45 sec)

### The Firestore Settings Crash

The AI placed this line inside the `HabitRemoteDataSource` constructor:

```dart
_db.settings = const Settings(persistenceEnabled: true);
```

**The problem:** On every Flutter hot restart, Firestore is already initialized, so reassigning `.settings` throws:

```
FirebaseException: Firestore has already been started and its settings can no longer be changed.
```

The app crashed on every hot restart during development — which would be a serious issue in a real team environment.

**What I did:** I identified that `.settings` must be set *once*, immediately after `Firebase.initializeApp()` and before any Firestore operation. I directed the AI to move it to `main.dart`:

```dart
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

FirebaseFirestore.instance.settings = const Settings(
  persistenceEnabled: true,
  cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
);

configureDependencies(); // DI setup — after Firestore settings
```

After this fix, hot restart worked perfectly every time.

---

## ✅ How I Verified Clean Architecture (30 sec)

Clean Architecture requires the **domain layer to be pure Dart** — no Flutter, no Firebase.

I verified this by running two grep commands:

```bash
grep -rn "import 'package:cloud_firestore" lib/features/habits/domain/
grep -rn "import 'package:flutter"          lib/features/habits/domain/
```

**Both returned zero results** — confirming the domain layer has no framework dependencies.

I also ran:

```bash
dart analyze lib/
```

Result: **`No issues found!`** — zero errors, zero warnings, zero deprecated API usage.

---

## 🎬 Close (15 sec)

> *"The AI handled the boilerplate and accelerated the build significantly — but it still needed human judgement for the Firestore lifecycle bug, architecture verification, and making sure each layer only had the dependencies it was supposed to have. That's the real workflow."*

---
