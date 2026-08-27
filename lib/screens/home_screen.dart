import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../data/player_data.dart';
import '../model/player.dart';
import '../widgets/points_badge_bar.dart';
import '../widgets/play_with_friend_card.dart';
import '../widgets/play_card.dart';
import '../widgets/fade_slide_wrapper.dart';
import '../widgets/tap_scale.dart';
import 'matchmaking_screen.dart';

const Curve _kSmoothCurve = Curves.easeInOutCubicEmphasized;
const Duration _kPanelDuration = Duration(milliseconds: 550);

enum HomeViewState { home, battle }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _entranceController;
  HomeViewState _viewState = HomeViewState.home;

  @override
  void initState() {
    super.initState();
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _entranceController.forward();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    super.dispose();
  }

  void _onPlayWithFriendClick() {
    setState(() {
      _viewState = HomeViewState.battle;
    });
  }

  void _onBack() {
    if (_viewState == HomeViewState.battle) {
      setState(() {
        _viewState = HomeViewState.home;
      });
    }
  }

  void _navigateToMatchmaking({Player? opponent}) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, _, _) =>
            MatchmakingScreen(opponent: opponent, isRandom: opponent == null),
        transitionDuration: const Duration(milliseconds: 550),
        transitionsBuilder: (_, animation, _, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          );
          return FadeTransition(
            opacity: curved,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.06),
                end: Offset.zero,
              ).animate(curved),
              child: child,
            ),
          );
        },
      ),
    );
  }

  Animation<double> _getAnim(double start, double end) {
    return CurvedAnimation(
      parent: _entranceController,
      curve: Interval(start, end, curve: Curves.easeOutQuint),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isHome = _viewState == HomeViewState.home;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Soft decorative glow blobs for a more premium, colorful look.
            Positioned(
              top: -80,
              right: -60,
              child: IgnorePointer(
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primaryPurple.withValues(alpha: 0.18),
                        AppColors.primaryPurple.withValues(alpha: 0.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              left: -80,
              child: IgnorePointer(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.vsPink.withValues(alpha: 0.14),
                        AppColors.vsPink.withValues(alpha: 0.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: FadeSlideWrapper(
                  animation: _getAnim(0.0, 0.4),
                  beginOffset: const Offset(0, -20),
                  child: const PointsBadgeBar(),
                ),
              ),
            ),

            AnimatedPositioned(
              duration: _kPanelDuration,
              curve: _kSmoothCurve,
              left: isHome ? 20 : -screenWidth * 0.6,
              top: 100,
              width: screenWidth * 0.6,
              child: AnimatedOpacity(
                duration: _kPanelDuration,
                curve: _kSmoothCurve,
                opacity: isHome ? 1.0 : 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeSlideWrapper(
                      animation: _getAnim(0.1, 0.5),
                      beginOffset: const Offset(-20, 0),
                      child: Text(
                        'Be the\nKing of\nChess',
                        style: GoogleFonts.poppins(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          color: AppColors.black,
                          height: 1.15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeSlideWrapper(
                      animation: _getAnim(0.2, 0.6),
                      beginOffset: const Offset(0, 40),
                      child: Image.asset(
                        'assets/images/chess.png',
                        height: 320,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            AnimatedPositioned(
              duration: _kPanelDuration,
              curve: _kSmoothCurve,
              left: isHome ? screenWidth : 20,
              top: 100,
              width: screenWidth * 0.5,
              child: AnimatedOpacity(
                duration: _kPanelDuration,
                curve: _kSmoothCurve,
                opacity: isHome ? 0.0 : 1.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          onPressed: _onBack,
                        ),
                        Text(
                          'Battle\nwith\nfriends',
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 400,
                      width: screenWidth * 0.45,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: PlayerData.friends.length,
                        itemBuilder: (context, index) {
                          final friend = PlayerData.friends[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: TapScale(
                              onTap: () =>
                                  _navigateToMatchmaking(opponent: friend),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundImage: AssetImage(
                                          friend.avatar,
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            color: friend.isOnline
                                                ? AppColors.onlineGreen
                                                : AppColors.offlineRed,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  if (!isHome) ...[
                                    Expanded(
                                      child: Text(
                                        friend.name,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            AnimatedPositioned(
              duration: _kPanelDuration,
              curve: _kSmoothCurve,
              right: 20,
              top: 100,
              width: isHome ? 140 : 180,
              child: SizedBox(
                width: isHome ? 140 : 180,
                child: Column(
                  children: [
                    PlayWithFriendCard(
                      onTap: isHome ? _onPlayWithFriendClick : () {},
                      width: isHome ? 140 : 180,
                      isExpanded: !isHome,
                    ),
                    const SizedBox(height: 16),
                    PlayCard(
                      title: 'Play with Random',
                      subtitle: 'Find your match',
                      isDark: true,
                      icon: Icons.public,
                      onTap: () => _navigateToMatchmaking(),
                      width: isHome ? 140 : 180,
                      isExpanded: !isHome,
                    ),
                    const SizedBox(height: 16),
                    PlayCard(
                      title: 'Play with Custom',
                      subtitle: 'Train yourself',
                      isDark: false,
                      icon: Icons.tune,
                      onTap: () {},
                      width: isHome ? 140 : 180,
                      isExpanded: !isHome,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
