import 'package:flutter/material.dart';
import '../models/parking_model.dart';
import '../theme/app_colors.dart';
import 'parking_booking_screen.dart';

class ParkingDetailsScreen extends StatelessWidget {
  final ParkingModel parking;

  const ParkingDetailsScreen({
    super.key,
    required this.parking,
  });

  @override
  Widget build(BuildContext context) {
    final bool canBook = parking.isOpen && parking.availableSpaces > 0;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Parking Details'),
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
            _infoTile(Icons.location_on, 'Location', parking.location),
            _infoTile(Icons.directions_walk, 'Distance', parking.distance),
            _infoTile(Icons.local_parking, 'Capacity', '${parking.capacity} slots'),
            _infoTile(
              Icons.event_available,
              'Available Spaces',
              '${parking.availableSpaces} spaces',
            ),
            _infoTile(Icons.payments, 'Pricing', parking.pricePerHour),
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
                                ParkingBookingScreen(parking: parking),
                          ),
                        );
                      }
                    : null,
                child: const Text(
                  'Book Parking Slot',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
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
            Icons.local_parking,
            color: AppColors.primaryOrange,
            size: 46,
          ),
          const SizedBox(height: 16),
          Text(
            parking.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            parking.location,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 18),
              Text(
                ' ${parking.rating}',
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