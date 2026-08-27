import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'tap_scale.dart';

class PointsBadgeBar extends StatelessWidget {
  const PointsBadgeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            gradient: AppColors.darkCardGradient,
            borderRadius: BorderRadius.circular(24),
            boxShadow: AppColors.glow(
              AppColors.black,
              blur: 16,
              opacity: 0.2,
              offset: const Offset(0, 6),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: AppColors.glow(
                    const Color(0xFFFFC107),
                    blur: 10,
                    opacity: 0.55,
                    offset: const Offset(0, 2),
                  ),
                ),
                child: const Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '480 point',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        TapScale(
          onTap: () {},
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: AppColors.glow(
                AppColors.black,
                blur: 12,
                opacity: 0.08,
                offset: const Offset(0, 4),
              ),
            ),
            child: const Icon(
              Icons.grid_view_rounded,
              color: AppColors.black,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}
