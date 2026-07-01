class WashServiceModel {
  final String name;
  final String type;
  final String duration;
  final String price;
  final double rating;
  final String description;
  final List<String> includes;

  WashServiceModel({
    required this.name,
    required this.type,
    required this.duration,
    required this.price,
    required this.rating,
    required this.description,
    required this.includes,
  });
}