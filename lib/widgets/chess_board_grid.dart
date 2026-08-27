import 'package:flutter/material.dart';
import '../constants.dart';
import 'chess_square.dart';

class ChessBoardGrid extends StatelessWidget {
  final List<List<String>> board;
  final double rotationX;
  final double rotationY;

  const ChessBoardGrid({
    super.key,
    required this.board,
    required this.rotationX,
    required this.rotationY,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(rotationX)
        ..rotateY(rotationY),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 30,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.boardFrame,
                      AppColors.boardFrameLight,
                      AppColors.boardFrame,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(8, (row) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(8, (col) {
                        final isLight = (row + col) % 2 == 0;
                        final piece = board[row][col];
                        return ChessSquare(isLight: isLight, piece: piece);
                      }),
                    );
                  }),
                ),
              ),
              Container(
                width: 8 * 36.0 + 16,
                height: 12,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.boardFrame.withValues(alpha: 0.8),
                      AppColors.boardFrame.withValues(alpha: 0.5),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
