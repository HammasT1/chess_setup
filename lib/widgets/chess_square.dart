import 'package:flutter/material.dart';
import '../constants.dart';

class ChessSquare extends StatelessWidget {
  final bool isLight;
  final String piece;

  const ChessSquare({super.key, required this.isLight, required this.piece});

  static const List<String> _whitePieces = ['♔', '♕', '♖', '♗', '♘', '♙'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: isLight ? AppColors.boardLight : AppColors.boardDark,
      ),
      child: piece.isNotEmpty
          ? Center(
              child: Text(
                piece,
                style: TextStyle(
                  fontSize: 24,
                  color: _whitePieces.contains(piece)
                      ? Colors.white
                      : const Color(0xFF1C1C1C),
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 2,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
