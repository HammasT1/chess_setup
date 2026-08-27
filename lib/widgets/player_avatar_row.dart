import 'package:flutter/material.dart';
import '../constants.dart';
import '../data/player_data.dart';

class PlayerAvatarRow extends StatelessWidget {
  const PlayerAvatarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: PlayerData.friends.length,
        separatorBuilder: (_, _) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final player = PlayerData.friends[index];
          return Stack(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.lightGray,
                backgroundImage: AssetImage(player.avatar),
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: player.isOnline
                        ? AppColors.onlineGreen
                        : AppColors.offlineRed,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
