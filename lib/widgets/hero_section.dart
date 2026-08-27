import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class HeroSection extends StatelessWidget {
  final Widget friendCard;

  const HeroSection({super.key, required this.friendCard});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Be the\nKing of\nChess',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 220,
                child: Image.asset(
                  'assets/images/chess.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        Expanded(flex: 4, child: friendCard),
      ],
    );
  }
}
