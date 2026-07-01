import 'package:flutter/material.dart';
import '../models/parking_model.dart';
import '../theme/app_colors.dart';
import 'parking_details_screen.dart';

class ParkingListingScreen extends StatelessWidget {
  const ParkingListingScreen({super.key});

  static final List<ParkingModel> parkingPlaces = [
    ParkingModel(
      name: 'City Center Parking',
      distance: '1.5 km',
      rating: 4.7,
      location: 'Colombo City Center',
      capacity: 120,
      availableSpaces: 35,
      pricePerHour: 'LKR 150 / hour',
      isOpen: true,
    ),
    ParkingModel(
      name: 'Quick Park Gampaha',
      distance: '2.3 km',
      rating: 4.5,
      location: 'Gampaha Town',
      capacity: 80,
      availableSpaces: 12,
      pricePerHour: 'LKR 100 / hour',
      isOpen: true,
    ),
    ParkingModel(
      name: 'Mall Secure Parking',
      distance: '3.9 km',
      rating: 4.3,
      location: 'Kadawatha',
      capacity: 200,
      availableSpaces: 0,
      pricePerHour: 'LKR 200 / hour',
      isOpen: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Parking Search'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: parkingPlaces.length,
        itemBuilder: (context, index) {
          final parking = parkingPlaces[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ParkingDetailsScreen(parking: parking),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: AppColors.primaryOrange.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.local_parking,
                      color: AppColors.primaryOrange,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          parking.name,
                          style: const TextStyle(
                            color: AppColors.deepNavy,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${parking.distance} • ${parking.pricePerHour}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${parking.availableSpaces} spaces available',
                          style: TextStyle(
                            color: parking.availableSpaces > 0
                                ? AppColors.availableGreen
                                : AppColors.unavailableRed,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}