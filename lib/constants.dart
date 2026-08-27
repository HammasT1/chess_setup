import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryPurple = Color(0xFF7B61FF);
  static const Color darkBg = Color(0xFF1A1A2E);
  static const Color darkCard = Color(0xFF16213E);
  static const Color offWhite = Color(0xFFF5F5F5);
  static const Color lightGray = Color(0xFFE8E8E8);
  static const Color white = Colors.white;
  static const Color black = Color(0xFF1C1C1C);
  static const Color onlineGreen = Color(0xFF4ADE80);
  static const Color offlineRed = Color(0xFFEF4444);
  static const Color offlineGray = Color(0xFF9CA3AF);
  static const Color vsPink = Color(0xFFFF4081);
  static const Color boardLight = Color(0xFFEEEED2);
  static const Color boardDark = Color(0xFF769656);
  static const Color boardFrame = Color(0xFF5C3A1E);
  static const Color boardFrameLight = Color(0xFF8B5E3C);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryPurple, vsPink],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    colors: [Color(0xFF26264A), Color(0xFF16162B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkBgGradient = LinearGradient(
    colors: [Color(0xFF17172B), Color(0xFF0B0B12)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static List<BoxShadow> glow(
    Color color, {
    double blur = 24,
    double opacity = 0.35,
    Offset offset = const Offset(0, 8),
  }) => [
    BoxShadow(
      color: color.withValues(alpha: opacity),
      blurRadius: blur,
      offset: offset,
    ),
  ];
}
