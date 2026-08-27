import '../model/player.dart';

class PlayerData {
  static const List<Player> friends = [
    Player(
      name: '@matteo',
      avatar: 'assets/images/p1.png',
      country: 'Italy',
      flag: '🇮🇹',
      isOnline: true,
    ),
    Player(
      name: '@zachary',
      avatar: 'assets/images/p2.png',
      country: 'USA',
      flag: '🇺🇸',
      isOnline: true,
    ),
    Player(
      name: '@lewando',
      avatar: 'assets/images/p3.png',
      country: 'Poland',
      flag: '🇵🇱',
      isOnline: true,
    ),
    Player(
      name: '@amirsah',
      avatar: 'assets/images/p4.png',
      country: 'Saudi Arabia',
      flag: '🇸🇦',
      isOnline: false,
    ),
    Player(
      name: '@sullivan',
      avatar: 'assets/images/p5.png',
      country: 'Indonesia',
      flag: '🇮🇩',
      isOnline: true,
    ),
  ];

  static const Player currentUser = Player(
    name: '@brooklyn',
    avatar: 'assets/images/c1.png',
    country: 'UK',
    flag: '🇬🇧',
  );
}
