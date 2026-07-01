class EvStationModel {
  final String name;
  final String distance;
  final double rating;
  final String address;
  final String chargerType;
  final int availableSlots;
  final String chargingSpeed;
  final String price;
  final bool isOpen;

  EvStationModel({
    required this.name,
    required this.distance,
    required this.rating,
    required this.address,
    required this.chargerType,
    required this.availableSlots,
    required this.chargingSpeed,
    required this.price,
    required this.isOpen,
  });
}