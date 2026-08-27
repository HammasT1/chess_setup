import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'tap_scale.dart';

class PlayCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDark;
  final IconData icon;
  final VoidCallback onTap;
  final double? width;
  final bool isExpanded;

  const PlayCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isDark,
    required this.icon,
    required this.onTap,
    this.width,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      width: width ?? double.infinity,
      padding: EdgeInsets.all(isExpanded ? 24 : 16),
      decoration: BoxDecoration(
        color: isDark ? null : Colors.white,
        gradient: isDark ? AppColors.darkCardGradient : null,
        borderRadius: BorderRadius.circular(24),
        boxShadow: isDark
            ? AppColors.glow(AppColors.black, blur: 18, opacity: 0.3)
            : AppColors.glow(
                AppColors.primaryPurple,
                blur: 20,
                opacity: 0.08,
                offset: const Offset(0, 6),
              ),
        image: isDark
            ? const DecorationImage(
                image: AssetImage('assets/images/map.png'),
                fit: BoxFit.cover,
                opacity: 0.15,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? Colors.white.withValues(alpha: 0.15)
                  : AppColors.offWhite,
            ),
            child: Icon(
              icon,
              color: isDark ? Colors.white : AppColors.black,
              size: 20,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: isExpanded ? 20 : 16,
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : AppColors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: isDark ? Colors.white60 : Colors.grey[600],
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          TapScale(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(12),
                boxShadow: AppColors.glow(
                  AppColors.primaryPurple,
                  blur: 14,
                  opacity: 0.35,
                  offset: const Offset(0, 4),
                ),
              ),
              child: Text(
                'Play now',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
