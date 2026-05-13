class NearbyFarmerModel {
  final String name;
  final String imageLetter;
  final String distance;
  final double rating;
  final int reviews;
  final String status;
  final List<String> tags;

  NearbyFarmerModel({
    required this.name,
    required this.imageLetter,
    required this.distance,
    required this.rating,
    required this.reviews,
    required this.status,
    required this.tags,
  });
}
