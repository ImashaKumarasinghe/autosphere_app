import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ProviderCard extends StatelessWidget {
  final String name;
  final String type;
  final String distance;
  final double rating;
  final String status;

  const ProviderCard({
    super.key,
    required this.name,
    required this.type,
    required this.distance,
    required this.rating,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOpen = status == 'Open';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: AppColors.primaryOrange.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.local_gas_station,
              color: AppColors.primaryOrange,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.deepNavy,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$type • $distance',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: isOpen
                  ? AppColors.availableGreen.withOpacity(0.12)
                  : AppColors.unavailableRed.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: isOpen
                    ? AppColors.availableGreen
                    : AppColors.unavailableRed,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}