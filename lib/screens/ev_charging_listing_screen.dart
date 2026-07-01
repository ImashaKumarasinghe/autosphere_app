import 'package:flutter/material.dart';
import '../models/ev_station_model.dart';
import '../theme/app_colors.dart';
import 'ev_charging_details_screen.dart';

class EvChargingListingScreen extends StatelessWidget {
  const EvChargingListingScreen({super.key});

  static final List<EvStationModel> evStations = [
    EvStationModel(
      name: 'EcoCharge Hub',
      distance: '2.5 km',
      rating: 4.8,
      address: 'Colombo City Center',
      chargerType: 'Type 2 / CCS',
      availableSlots: 4,
      chargingSpeed: 'Fast Charging',
      price: 'LKR 120 per kWh',
      isOpen: true,
    ),
    EvStationModel(
      name: 'GreenVolt Station',
      distance: '3.7 km',
      rating: 4.5,
      address: 'Nugegoda Main Road',
      chargerType: 'CHAdeMO / CCS',
      availableSlots: 2,
      chargingSpeed: 'Rapid Charging',
      price: 'LKR 150 per kWh',
      isOpen: true,
    ),
    EvStationModel(
      name: 'AutoCharge Point',
      distance: '5.2 km',
      rating: 4.2,
      address: 'Gampaha Town',
      chargerType: 'Type 2',
      availableSlots: 0,
      chargingSpeed: 'Normal Charging',
      price: 'LKR 100 per kWh',
      isOpen: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('EV Charging'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: evStations.length,
        itemBuilder: (context, index) {
          final station = evStations[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EvChargingDetailsScreen(station: station),
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
                      color: AppColors.infoBlue.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.electric_car,
                      color: AppColors.infoBlue,
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
                          '${station.distance} • ${station.chargingSpeed}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${station.availableSlots} slots available',
                          style: TextStyle(
                            color: station.availableSlots > 0
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