class ParkingModel {
  final String name;
  final String distance;
  final double rating;
  final String location;
  final int capacity;
  final int availableSpaces;
  final String pricePerHour;
  final bool isOpen;

  ParkingModel({
    required this.name,
    required this.distance,
    required this.rating,
    required this.location,
    required this.capacity,
    required this.availableSpaces,
    required this.pricePerHour,
    required this.isOpen,
  });
}