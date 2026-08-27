import 'package:flutter/material.dart';
import 'chess_board_grid.dart';

class ChessBoard3D extends StatefulWidget {
  const ChessBoard3D({super.key});

  @override
  State<ChessBoard3D> createState() => ChessBoard3DState();
}

class ChessBoard3DState extends State<ChessBoard3D>
    with TickerProviderStateMixin {
  double rotationX = 0.55;
  double rotationY = 0.0;
  late AnimationController entranceController;
  late Animation<double> entranceAnimation;

  // Eases the board back to its resting tilt once a drag ends, so the
  // 3D tilt feels alive and springy rather than freezing where it's dropped.
  late AnimationController _settleController;
  Animation<double>? _settleRotationX;
  Animation<double>? _settleRotationY;
  static const double _restRotationX = 0.55;
  static const double _restRotationY = 0.0;

  static const String wKing = '♔';
  static const String wQueen = '♕';
  static const String wRook = '♖';
  static const String wBishop = '♗';
  static const String wKnight = '♘';
  static const String wPawn = '♙';

  static const String bKing = '♚';
  static const String bQueen = '♛';
  static const String bRook = '♜';
  static const String bBishop = '♝';
  static const String bKnight = '♞';
  static const String bPawn = '♟';

  final List<List<String>> board = [
    [bRook, bKnight, bBishop, bQueen, bKing, bBishop, bKnight, bRook],
    [bPawn, bPawn, bPawn, bPawn, bPawn, bPawn, bPawn, bPawn],
    ['', '', '', '', '', '', '', ''],
    ['', '', '', '', '', '', '', ''],
    ['', '', '', '', '', '', '', ''],
    ['', '', '', '', '', '', '', ''],
    [wPawn, wPawn, wPawn, wPawn, wPawn, wPawn, wPawn, wPawn],
    [wRook, wKnight, wBishop, wQueen, wKing, wBishop, wKnight, wRook],
  ];

  @override
  void initState() {
    super.initState();
    entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    entranceAnimation = CurvedAnimation(
      parent: entranceController,
      curve: Curves.easeOutBack,
    );
    entranceController.forward();

    _settleController =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 650),
        )..addListener(() {
          if (_settleRotationX != null && _settleRotationY != null) {
            setState(() {
              rotationX = _settleRotationX!.value;
              rotationY = _settleRotationY!.value;
            });
          }
        });
  }

  @override
  void dispose() {
    entranceController.dispose();
    _settleController.dispose();
    super.dispose();
  }

  void _settleBoard() {
    _settleRotationX = Tween<double>(begin: rotationX, end: _restRotationX)
        .animate(
          CurvedAnimation(
            parent: _settleController,
            curve: Curves.easeOutCubic,
          ),
        );
    _settleRotationY = Tween<double>(begin: rotationY, end: _restRotationY)
        .animate(
          CurvedAnimation(
            parent: _settleController,
            curve: Curves.easeOutCubic,
          ),
        );
    _settleController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: entranceController,
      builder: (context, child) {
        return Opacity(
          opacity: entranceAnimation.value.clamp(0.0, 1.0),
          child: Transform.scale(
            scale: 0.5 + (entranceAnimation.value * 0.5),
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            rotationY += details.delta.dx * 0.008;
            rotationX -= details.delta.dy * 0.008;
            rotationX = rotationX.clamp(-1.2, 1.2);
          });
        },
        onPanEnd: (_) => _settleBoard(),
        onPanCancel: _settleBoard,
        child: ChessBoardGrid(
          board: board,
          rotationX: rotationX,
          rotationY: rotationY,
        ),
      ),
    );
  }
}
