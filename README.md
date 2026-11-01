<div align="center">

# ♟️ CHESS CONCEPT

### Glowing gradients. Tactile motion. A 3D board you can drag.

*A sleek, animation-driven Flutter chess app concept, built as a UI/UX showcase.*

<br/>

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.10-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-3DDC84?style=for-the-badge)](#-getting-started)
[![Status](https://img.shields.io/badge/Status-Concept%20%2F%20Demo-FFC107?style=for-the-badge)](#-overview)
[![License: MIT](https://img.shields.io/badge/License-MIT-22C55E?style=for-the-badge)](LICENSE)

![Animations](https://img.shields.io/badge/✨_Animations-vanilla_Flutter-7B61FF?style=flat-square)
![Packages](https://img.shields.io/badge/📦_Animation_packages-zero-FF4081?style=flat-square)
![State](https://img.shields.io/badge/🧠_State-StatefulWidget-lightgrey?style=flat-square)
![Haptics](https://img.shields.io/badge/📳_Haptic-tap_feedback-orange?style=flat-square)

<br/>

[**✨ Overview**](#-overview) &nbsp;•&nbsp;
[**🖼️ Screens**](#️-screens) &nbsp;•&nbsp;
[**🎯 Features**](#-features) &nbsp;•&nbsp;
[**📁 Structure**](#-project-structure) &nbsp;•&nbsp;
[**🚀 Get Started**](#-getting-started) &nbsp;•&nbsp;
[**🎨 Design System**](#-design-system) &nbsp;•&nbsp;
[**🗺️ Roadmap**](#️-roadmap)

<br/>

```text
    a  b  c  d  e  f  g  h
 8  ♜  ♞  ♝  ♛  ♚  ♝  ♞  ♜
 7  ♟  ♟  ♟  ♟  ♟  ♟  ♟  ♟
 6  ·  ·  ·  ·  ·  ·  ·  ·
 5  ·  ·  ·  ·  ·  ·  ·  ·
 4  ·  ·  ·  ·  ·  ·  ·  ·
 3  ·  ·  ·  ·  ·  ·  ·  ·
 2  ♙  ♙  ♙  ♙  ♙  ♙  ♙  ♙
 1  ♖  ♘  ♗  ♕  ♔  ♗  ♘  ♖
```

🔗 **Repository:** [github.com/HammasT1/chess_setup](https://github.com/HammasT1/chess_setup)

</div>

---

## ✨ Overview

**Chess Concept** is a front-end showcase of a modern chess matchmaking app. It focuses on **polished motion design and UI craft**: staggered entrance animations, spring-like physics, gradient glows and haptic-backed tap feedback, all built with vanilla Flutter and **no animation packages**.

> [!NOTE]
> This is a UI/UX concept, not a functional chess engine. There is no move validation and no multiplayer backend. It was built for design and animation practice.

<br/>

## 🖼️ Screens

<table>
  <tr>
    <td width="50%" valign="top">
      <h3>🏠 Home</h3>
      A hero header, a points badge, and three animated play options. The layout morphs smoothly when you switch to friend selection.
    </td>
    <td width="50%" valign="top">
      <h3>👥 Battle with Friends</h3>
      A sliding friend list with online and offline status, picked straight from the home layout.
    </td>
  </tr>
  <tr>
    <td width="50%" valign="top">
      <h3>🎲 Matchmaking</h3>
      A cycling opponent search with a slow map zoom, a pulsing <b>VS</b> badge, and a settle-in reveal card.
    </td>
    <td width="50%" valign="top">
      <h3>♟️ Game</h3>
      A draggable, tilting 3D chess board with live per-second countdown timers for both players.
    </td>
  </tr>
</table>

<br/>

## 🎯 Features

| | Feature | Details |
|:-:|:--|:--|
| 🎨 | **Gradient design system** | Purple → pink accent gradients, glowing shadows and soft ambient colour blobs instead of flat fills |
| 🧲 | **Tactile interactions** | Every button and card has a reusable press-scale and haptic tick (`TapScale`) |
| 🌀 | **Layout-morphing home** | One screen reflows between "Home" and "Battle with Friends" using `AnimatedPositioned` and `AnimatedOpacity` |
| 🎲 | **Animated matchmaking** | Opponents cycle with combined fade and scale transitions before settling on a match |
| ♟️ | **Interactive 3D board** | Drag to tilt and rotate the board in 3D space; on release it springs back to a resting angle |
| ⏱️ | **Live countdown timers** | Per-second digit changes animate with a smooth fade and slide instead of hard-cutting |
| 🧩 | **Reusable widgets** | Small, composable pieces (`PlayCard`, `FadeSlideWrapper`, `TapScale`, `ChessBoardGrid`, `ChessSquare`, …) instead of one monolithic screen |

<br/>

## 🛠️ Tech Stack

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-SDK%20%5E3.10.7-02569B?style=flat-square&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-Language-0175C2?style=flat-square&logo=dart&logoColor=white)](https://dart.dev)
[![google_fonts](https://img.shields.io/badge/google__fonts-Poppins-F4B400?style=flat-square)](https://pub.dev/packages/google_fonts)
[![Icons](https://img.shields.io/badge/Icons-Cupertino%20%2B%20Material-607D8B?style=flat-square)](https://api.flutter.dev/flutter/material/Icons-class.html)

</div>

| Area | Details |
|:--|:--|
| **Framework** | [Flutter](https://flutter.dev) (SDK `^3.10.7`) |
| **Language** | Dart |
| **Fonts** | [google_fonts](https://pub.dev/packages/google_fonts) (Poppins) |
| **Icons** | Cupertino Icons and Material Icons |
| **Animations** | Built-in Flutter APIs only: `AnimationController`, `AnimatedBuilder`, `AnimatedSwitcher`, `AnimatedContainer` / `AnimatedPositioned`, `CurvedAnimation`. No third-party animation packages |
| **State management** | Local `StatefulWidget` state, with no external state library |

<br/>

## 📁 Project Structure

```text
lib/
├── main.dart                     # App entry point & theme
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

<br/>

## 🚀 Getting Started

### 📋 Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x, Dart ≥ 3.10)
- An Android emulator, iOS simulator, or a Chrome / desktop target

### ⚡ Clone and run

```bash
# Clone the repo
git clone https://github.com/HammasT1/chess_setup.git
cd chess_setup

# Install dependencies
flutter pub get

# Check for issues
flutter analyze

# Run on a connected device or emulator
flutter run
```

<details>
<summary><b>🎯 Run on a specific device (click to expand)</b></summary>

<br/>

```bash
flutter devices            # list available devices and emulators
flutter run -d <deviceId>
```

</details>

<br/>

## 🎨 Design System

All shared colours, gradients and reusable glow-shadow helpers live in [`lib/constants.dart`](lib/constants.dart).

| Swatch | Token | Value |
|:-:|:--|:--|
| ![#7B61FF](https://img.shields.io/badge/%20%20%20%20%20%20%20%20-7B61FF?style=flat-square) | **Primary** (purple) | `#7B61FF` |
| ![#FF4081](https://img.shields.io/badge/%20%20%20%20%20%20%20%20-FF4081?style=flat-square) | **Accent** (pink) | `#FF4081` |
| ![#26264A](https://img.shields.io/badge/%20%20%20%20%20%20%20%20-26264A?style=flat-square) | **Dark card gradient** (start) | `#26264A` |
| ![#16162B](https://img.shields.io/badge/%20%20%20%20%20%20%20%20-16162B?style=flat-square) | **Dark card gradient** (end) | `#16162B` |
| ![#EEEED2](https://img.shields.io/badge/%20%20%20%20%20%20%20%20-EEEED2?style=flat-square) | **Board light square** | `#EEEED2` |
| ![#769656](https://img.shields.io/badge/%20%20%20%20%20%20%20%20-769656?style=flat-square) | **Board dark square** | `#769656` |

| Token | Value |
|:--|:--|
| **Primary gradient** | `primaryPurple → vsPink`, top-left → bottom-right |
| **Font** | Poppins (via `google_fonts`) |

<br/>

## 📸 Screenshots

<!--
Add your screenshots to docs/screenshots/ and uncomment the table below.

<div align="center">

| 🏠 Home | 🎲 Matchmaking | ♟️ Game |
|:-------:|:--------------:|:-------:|
| <img src="docs/screenshots/home.png" width="240" /> | <img src="docs/screenshots/matchmaking.png" width="240" /> | <img src="docs/screenshots/game.png" width="240" /> |

</div>
-->

<div align="center"><i>📷 Screenshots coming soon.</i></div>

<br/>

## 🗺️ Roadmap

- [ ] Real chess move validation and legal-move highlighting
- [ ] Multiplayer backend (WebSocket / Firebase) for live matches
- [ ] Persistent player profiles and point history
- [ ] Sound effects for moves, captures and check

<br/>

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

<div align="center">

### Made with ❤️ using Flutter

⭐ **If you like the motion design, give it a star.** ⭐

<sub>A UI/UX concept project, built for design and animation practice, not a production chess engine.</sub>

</div>
