import 'package:flutter/material.dart';
import '../models/wash_service_model.dart';
import '../theme/app_colors.dart';
import 'wash_service_details_screen.dart';

class VehicleWashListingScreen extends StatelessWidget {
  final String screenTitle;

  const VehicleWashListingScreen({
    super.key,
    required this.screenTitle,
  });

  static final List<WashServiceModel> services = [
    WashServiceModel(
      name: 'Quick Normal Wash',
      type: 'Normal Wash',
      duration: '30 min',
      price: 'LKR 800',
      rating: 4.5,
      description: 'Basic exterior wash for daily vehicle cleaning.',
      includes: ['Exterior wash', 'Water spray', 'Basic drying'],
    ),
    WashServiceModel(
      name: 'Full Vehicle Wash',
      type: 'Full Wash',
      duration: '1 hour',
      price: 'LKR 1500',
      rating: 4.7,
      description: 'Complete wash package for inside and outside cleaning.',
      includes: ['Exterior wash', 'Interior vacuum', 'Tyre cleaning', 'Dashboard wipe'],
    ),
    WashServiceModel(
      name: 'Interior Cleaning',
      type: 'Interior Cleaning',
      duration: '45 min',
      price: 'LKR 1200',
      rating: 4.6,
      description: 'Deep interior cleaning for seats, carpets, and dashboard.',
      includes: ['Vacuum cleaning', 'Seat cleaning', 'Dashboard polish'],
    ),
    WashServiceModel(
      name: 'Premium Detailing Package',
      type: 'Detailing',
      duration: '3 hours',
      price: 'LKR 5500',
      rating: 4.9,
      description: 'Premium detailing service to refresh vehicle appearance.',
      includes: ['Full wash', 'Interior detailing', 'Wax polish', 'Tyre shine'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredServices = screenTitle == 'Detailing'
        ? services.where((service) => service.type == 'Detailing').toList()
        : services.where((service) => service.type != 'Detailing').toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(screenTitle),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filteredServices.length,
        itemBuilder: (context, index) {
          final service = filteredServices[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WashServiceDetailsScreen(service: service),
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
                    child: Icon(
                      service.type == 'Detailing'
                          ? Icons.cleaning_services
                          : Icons.local_car_wash,
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
                          service.name,
                          style: const TextStyle(
                            color: AppColors.deepNavy,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${service.duration} • ${service.price}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            Text(' ${service.rating}'),
                          ],
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