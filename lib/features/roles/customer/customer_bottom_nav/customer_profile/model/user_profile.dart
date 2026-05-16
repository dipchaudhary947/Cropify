class UserProfile {
  final String name;
  final String email;
  final String membership;
  final int totalOrders;
  final int totalFavorites;
  final double amountSaved;

  UserProfile({
    required this.name,
    required this.email,
    required this.membership,
    required this.totalOrders,
    required this.totalFavorites,
    required this.amountSaved,
  });
}
