import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../data/opponent_data.dart';
import '../model/opponent.dart';
import '../data/player_data.dart';
import '../model/player.dart';
import 'game_screen.dart';

class MatchmakingScreen extends StatefulWidget {
  final Player? opponent;
  final bool isRandom;

  const MatchmakingScreen({super.key, this.opponent, this.isRandom = true});

  @override
  State<MatchmakingScreen> createState() => _MatchmakingScreenState();
}

class _MatchmakingScreenState extends State<MatchmakingScreen>
    with TickerProviderStateMixin {
  late AnimationController _mapController;
  late AnimationController _cardController;
  late AnimationController _pulseController;
  late Animation<double> _mapScale;
  late Animation<Offset> _mapOffset;
  late Animation<double> _cardFade;
  late Animation<double> _cardScale;
  late Animation<double> _pulseAnimation;

  int _currentOpponentIndex = 0;
  Timer? _cycleTimer;
  bool _settled = false;

  late Player _finalOpponent;

  @override
  void initState() {
    super.initState();

    _finalOpponent =
        widget.opponent ??
        PlayerData.friends[Random().nextInt(PlayerData.friends.length)];

    _mapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    );
    _mapScale = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(CurvedAnimation(parent: _mapController, curve: Curves.easeInOut));
    _mapOffset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-20, -10),
    ).animate(CurvedAnimation(parent: _mapController, curve: Curves.easeInOut));

    _cardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _cardFade = CurvedAnimation(parent: _cardController, curve: Curves.easeOut);
    _cardScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _cardController, curve: Curves.easeOutBack),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _mapController.forward();
    _cardController.forward();

    if (widget.isRandom) {
      _cycleTimer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
        if (timer.tick >= 3) {
          timer.cancel();
          setState(() {
            _settled = true;
          });
          Future.delayed(const Duration(milliseconds: 800), navigateToGame);
        } else {
          setState(() {
            _currentOpponentIndex =
                (_currentOpponentIndex + 1) % opponents.length;
          });
        }
      });
    } else {
      setState(() {
        _settled = true;
      });
      Future.delayed(const Duration(seconds: 3), navigateToGame);
    }
  }

  void navigateToGame() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, _, _) => GameScreen(opponent: _finalOpponent),
        transitionDuration: const Duration(milliseconds: 700),
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    _cardController.dispose();
    _pulseController.dispose();
    _cycleTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentOpponent = (widget.isRandom && !_settled)
        ? Opponent(
            opponents[_currentOpponentIndex].avatar,
            opponents[_currentOpponentIndex].name,
          )
        : Opponent(_finalOpponent.avatar, _finalOpponent.name);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.darkBgGradient),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _mapController,
              builder: (context, child) {
                return Transform.translate(
                  offset: _mapOffset.value,
                  child: Transform.scale(scale: _mapScale.value, child: child),
                );
              },
              child: SizedBox.expand(
                child: Opacity(
                  opacity: 0.4,
                  child: Image.asset(
                    'assets/images/map.png',
                    fit: BoxFit.cover,
                    color: Colors.white.withValues(alpha: 0.6),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
              ),
            ),
            Center(
              child: FadeTransition(
                opacity: _cardFade,
                child: ScaleTransition(
                  scale: _cardScale,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: AppColors.lightGray,
                              backgroundImage: const AssetImage(
                                'assets/images/c1.png',
                              ),
                            ),
                            const SizedBox(width: 12),
                            AnimatedBuilder(
                              animation: _pulseController,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: (widget.isRandom && !_settled)
                                      ? _pulseAnimation.value
                                      : 1.0,
                                  child: child,
                                );
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.primaryPurple,
                                      AppColors.vsPink,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'VS',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 350),
                              switchInCurve: Curves.easeOutBack,
                              switchOutCurve: Curves.easeIn,
                              transitionBuilder: (child, animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                key: ValueKey(currentOpponent.avatar),
                                radius: 30,
                                backgroundColor: AppColors.lightGray,
                                backgroundImage: AssetImage(
                                  currentOpponent.avatar,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '@brooklyn',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(width: 36),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (child, animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0, 0.4),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  ),
                                );
                              },
                              child: Text(
                                currentOpponent.name,
                                key: ValueKey(currentOpponent.name),
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
