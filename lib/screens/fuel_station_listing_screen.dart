import 'package:flutter/material.dart';
import '../models/fuel_station_model.dart';
import '../theme/app_colors.dart';
import 'fuel_station_details_screen.dart';

class FuelStationListingScreen extends StatelessWidget {
  const FuelStationListingScreen({super.key});

  static final List<FuelStationModel> fuelStations = [
    FuelStationModel(
      name: 'City Fuel Station',
      distance: '1.2 km',
      rating: 4.6,
      address: 'Main Street, Colombo',
      openingHours: '6.00 AM - 10.00 PM',
      contact: '+94 77 123 4567',
      fuelTypes: ['Petrol', 'Diesel'],
      offer: '2% discount for card payments',
      isOpen: true,
    ),
    FuelStationModel(
      name: 'AutoFuel Express',
      distance: '2.8 km',
      rating: 4.4,
      address: 'Gampaha Road, Gampaha',
      openingHours: '24 Hours',
      contact: '+94 76 555 8899',
      fuelTypes: ['Petrol', 'Diesel', 'Super Diesel'],
      offer: 'Free tyre pressure check',
      isOpen: true,
    ),
    FuelStationModel(
      name: 'Highway Fuel Mart',
      distance: '4.1 km',
      rating: 4.1,
      address: 'Highway Entrance, Kadawatha',
      openingHours: '7.00 AM - 9.00 PM',
      contact: '+94 71 888 2222',
      fuelTypes: ['Petrol'],
      offer: 'No current offers',
      isOpen: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Fuel Stations'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: fuelStations.length,
        itemBuilder: (context, index) {
          final station = fuelStations[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FuelStationDetailsScreen(station: station),
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
                      Icons.local_gas_station,
                      color: AppColors.primaryOrange,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          station.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.deepNavy,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${station.distance} • ${station.openingHours}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 16),
                            Text(' ${station.rating}'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: station.isOpen
                          ? AppColors.availableGreen.withOpacity(0.12)
                          : AppColors.unavailableRed.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      station.isOpen ? 'Open' : 'Closed',
                      style: TextStyle(
                        color: station.isOpen
                            ? AppColors.availableGreen
                            : AppColors.unavailableRed,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}