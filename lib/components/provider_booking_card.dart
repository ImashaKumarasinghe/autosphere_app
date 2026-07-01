import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ProviderBookingCard extends StatelessWidget {
  final String customerName;
  final String serviceName;
  final String time;
  final String status;

  const ProviderBookingCard({
    super.key,
    required this.customerName,
    required this.serviceName,
    required this.time,
    required this.status,
  });

  Color _statusColor() {
    if (status == 'Accepted') return AppColors.availableGreen;
    if (status == 'Pending') return AppColors.limitedYellow;
    if (status == 'Completed') return AppColors.infoBlue;
    return AppColors.unavailableRed;
  }

  @override
  Widget build(BuildContext context) {
    final color = _statusColor();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryOrange.withOpacity(0.12),
            child: const Icon(
              Icons.person,
              color: AppColors.primaryOrange,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customerName,
                  style: const TextStyle(
                    color: AppColors.deepNavy,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  serviceName,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    color: AppColors.deepNavy,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.14),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}