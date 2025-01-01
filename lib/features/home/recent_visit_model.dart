class RecentVisit {
  final String name;
  final String specialty;
  final String rating;
  final String price;
  final String image;
  bool isFavorite;

  RecentVisit({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.price,
    required this.image,
    this.isFavorite = false,
  });
}
