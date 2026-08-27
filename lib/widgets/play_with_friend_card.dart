import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'tap_scale.dart';

class PlayWithFriendCard extends StatelessWidget {
  final VoidCallback onTap;
  final double? width;
  final bool isExpanded;

  const PlayWithFriendCard({
    super.key,
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
        gradient: AppColors.darkCardGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppColors.glow(AppColors.black, blur: 18, opacity: 0.3),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
              ),
              boxShadow: AppColors.glow(
                const Color(0xFFFFC107),
                blur: 12,
                opacity: 0.5,
                offset: const Offset(0, 3),
              ),
            ),
            child: const Icon(
              Icons.emoji_events,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Play with\nFriend',
            style: GoogleFonts.poppins(
              fontSize: isExpanded ? 20 : 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Choose and play\nwith your friend',
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: Colors.white60,
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
