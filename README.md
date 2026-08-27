# ♟️ Chess Concept

A sleek, animation-driven Flutter chess app concept — glowing gradients, tactile micro-interactions, and a draggable 3D chess board, built as a UI/UX showcase.

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.10-0175C2?logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-informational)
![Status](https://img.shields.io/badge/Status-Concept%2FDemo-yellow)
![License](https://img.shields.io/badge/License-MIT-green.svg)

🔗 **Repository:** [github.com/HammasT1/chess_setup](https://github.com/HammasT1/chess_setup)

---

## ✨ Overview

**Chess Concept** is a front-end showcase of a modern chess matchmaking app. It's not a functional chess engine — there's no move validation or multiplayer backend — instead it focuses on **polished motion design and UI craft**: staggered entrance animations, spring-like physics, gradient glows, and haptic-backed tap feedback, all built with vanilla Flutter (no animation packages).

## 🖼️ Screens

| Screen | What it shows |
|---|---|
| **Home** | Hero header, points badge, and three animated play options that morph the layout when switching to friend selection |
| **Battle with Friends** | A sliding friend list with online/offline status, picked straight from the home layout |
| **Matchmaking** | A cycling opponent search animation with a slow map zoom, pulsing "VS" badge, and a settle-in reveal card |
| **Game** | A draggable, tilting 3D chess board with live per-second countdown timers for both players |

## 🎯 Features

- 🎨 **Gradient-driven design system** — purple → pink accent gradients, glowing shadows, and soft ambient color blobs instead of flat fills
- 🧲 **Tactile interactions** — every button and card has a reusable press-scale + haptic tick (`TapScale`)
- 🌀 **Layout-morphing home screen** — the same screen smoothly reflows between "Home" and "Battle with Friends" states via `AnimatedPositioned` + `AnimatedOpacity`
- 🎲 **Animated matchmaking** — opponents cycle with combined fade/scale transitions before settling on a match
- ♟️ **Interactive 3D chess board** — drag to tilt/rotate the board in 3D space; releases spring back to a resting angle
- ⏱️ **Live countdown timers** — per-second digit changes animate in with a smooth fade + slide instead of hard-cutting
- 🧩 **Reusable widget system** — small, composable widgets (`PlayCard`, `FadeSlideWrapper`, `TapScale`, `ChessBoardGrid`, `ChessSquare`, …) instead of one monolithic screen

## 🛠️ Tech Stack

| | |
|---|---|
| **Framework** | [Flutter](https://flutter.dev) (SDK `^3.10.7`) |
| **Language** | Dart |
| **Fonts** | [google_fonts](https://pub.dev/packages/google_fonts) (Poppins) |
| **Icons** | Cupertino Icons + Material Icons |
| **Animations** | Built-in Flutter animation APIs only — `AnimationController`, `AnimatedBuilder`, `AnimatedSwitcher`, `AnimatedContainer`/`AnimatedPositioned`, `CurvedAnimation` — no third-party animation packages |
| **State management** | Local `StatefulWidget` state (no external state management library) |

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point & theme
├── constants.dart                # Colors, gradients, and shadow helpers
├── data/
│   ├── opponent_data.dart        # Sample opponent pool for matchmaking
│   └── player_data.dart          # Current user + friends list
├── model/
│   ├── opponent.dart
│   └── player.dart
├── screens/
│   ├── home_screen.dart          # Home + "Battle with Friends" morphing layout
│   ├── matchmaking_screen.dart   # Opponent search & reveal animation
│   └── game_screen.dart          # Live game view with timers + 3D board
└── widgets/
    ├── chess_board_3d.dart       # Draggable 3D board wrapper (rotation + spring-back)
    ├── chess_board_grid.dart     # 8x8 board layout & frame
    ├── chess_square.dart         # Single square + piece glyph
    ├── fade_slide_wrapper.dart   # Reusable fade + translate entrance animation
    ├── game_top_bar.dart         # In-game back/menu bar
    ├── play_card.dart            # "Play with Random" / "Play with Custom" cards
    ├── play_with_friend_card.dart
    ├── points_badge_bar.dart     # Top points chip + grid icon
    └── tap_scale.dart            # Reusable press-scale + haptic tap wrapper
```

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x, Dart ≥3.10)
- An Android emulator, iOS simulator, or Chrome/desktop target

### Clone & Run

```bash
# Clone the repo
git clone https://github.com/HammasT1/chess_setup.git
cd chess_setup

# Install dependencies
flutter pub get

# Check for issues
flutter analyze

# Run on a connected device/emulator
flutter run
```

To target a specific device:

```bash
flutter devices          # list available devices/emulators
flutter run -d <deviceId>
```

## 🎨 Design System

| Token | Value |
|---|---|
| Primary | `#7B61FF` (purple) |
| Accent | `#FF4081` (pink) |
| Primary Gradient | `primaryPurple → vsPink`, top-left → bottom-right |
| Dark Card Gradient | `#26264A → #16162B` |
| Board Light / Dark | `#EEEED2` / `#769656` |
| Font | Poppins (via `google_fonts`) |

All shared colors, gradients, and reusable glow-shadow helpers live in [`lib/constants.dart`](lib/constants.dart).

## 🗺️ Roadmap Ideas

- Real chess move validation & legal-move highlighting
- Multiplayer backend (WebSocket/Firebase) for live matches
- Persistent player profiles & point history
- Sound effects for moves, captures, and check

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

<sub>This is a UI/UX concept project — built for design and animation practice, not a production chess engine.</sub>
