class Player {
  final String name;
  final String avatar;
  final String country;
  final String flag;
  final bool isOnline;

  const Player({
    required this.name,
    required this.avatar,
    required this.country,
    required this.flag,
    this.isOnline = true,
  });
}
