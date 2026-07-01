import 'package:flutter/material.dart';
import '../models/ev_station_model.dart';
import '../theme/app_colors.dart';
import 'charging_slot_booking_screen.dart';

class EvChargingDetailsScreen extends StatelessWidget {
  final EvStationModel station;

  const EvChargingDetailsScreen({
    super.key,
    required this.station,
  });

  @override
  Widget build(BuildContext context) {
    final bool canBook = station.availableSlots > 0 && station.isOpen;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Charging Details'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _heroCard(),
            const SizedBox(height: 20),
            _infoTile(Icons.ev_station, 'Charger Type', station.chargerType),
            _infoTile(Icons.speed, 'Charging Speed', station.chargingSpeed),
            _infoTile(Icons.attach_money, 'Price', station.price),
            _infoTile(Icons.location_on, 'Location', station.address),
            _infoTile(
              Icons.event_available,
              'Available Slots',
              station.availableSlots.toString(),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      canBook ? AppColors.primaryOrange : Colors.grey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: canBook
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ChargingSlotBookingScreen(station: station),
                          ),
                        );
                      }
                    : null,
                child: const Text(
                  'Reserve Charging Slot',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _heroCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.deepNavy,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.electric_car,
            color: AppColors.infoBlue,
            size: 44,
          ),
          const SizedBox(height: 16),
          Text(
            station.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${station.distance} away',
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 18),
              Text(
                ' ${station.rating}',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryOrange),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.deepNavy,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}