import 'package:flutter/material.dart';
import '../models/wash_service_model.dart';
import '../theme/app_colors.dart';
import 'wash_service_booking_screen.dart';

class WashServiceDetailsScreen extends StatelessWidget {
  final WashServiceModel service;

  const WashServiceDetailsScreen({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Service Details'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heroCard(),

            const SizedBox(height: 20),

            _sectionTitle('Description'),
            const SizedBox(height: 8),
            Text(
              service.description,
              style: TextStyle(
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            _sectionTitle('Package Includes'),
            const SizedBox(height: 10),

            Column(
              children: service.includes.map((item) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.cardWhite,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.availableGreen,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        item,
                        style: const TextStyle(
                          color: AppColors.deepNavy,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WashServiceBookingScreen(service: service),
                    ),
                  );
                },
                child: const Text(
                  'Book This Service',
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
          Icon(
            service.type == 'Detailing'
                ? Icons.cleaning_services
                : Icons.local_car_wash,
            color: AppColors.primaryOrange,
            size: 46,
          ),
          const SizedBox(height: 16),
          Text(
            service.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${service.duration} • ${service.price}',
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 18),
              Text(
                ' ${service.rating}',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.deepNavy,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}