class FuelStationModel {
  final String name;
  final String distance;
  final double rating;
  final String address;
  final String openingHours;
  final String contact;
  final List<String> fuelTypes;
  final String offer;
  final bool isOpen;

  FuelStationModel({
    required this.name,
    required this.distance,
    required this.rating,
    required this.address,
    required this.openingHours,
    required this.contact,
    required this.fuelTypes,
    required this.offer,
    required this.isOpen,
  });
}