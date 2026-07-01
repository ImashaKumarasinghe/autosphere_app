import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  final List<Map<String, String>> reports = const [
    {
      'title': 'Daily Customers',
      'value': '38',
      'subtitle': '+12% compared to yesterday',
    },
    {
      'title': 'Monthly Revenue',
      'value': 'LKR 420K',
      'subtitle': 'Current month earnings',
    },
    {
      'title': 'Service Performance',
      'value': '86%',
      'subtitle': 'Completed service rate',
    },
    {
      'title': 'Customer Rating',
      'value': '4.8',
      'subtitle': 'Average provider rating',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Reports'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reports.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 1.15,
        ),
        itemBuilder: (context, index) {
          final report = reports[index];

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardWhite,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.analytics,
                  color: AppColors.primaryOrange,
                  size: 30,
                ),
                const SizedBox(height: 14),
                Text(
                  report['value']!,
                  style: const TextStyle(
                    color: AppColors.deepNavy,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  report['title']!,
                  style: const TextStyle(
                    color: AppColors.deepNavy,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  report['subtitle']!,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}