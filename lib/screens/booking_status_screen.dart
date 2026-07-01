import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BookingStatusScreen extends StatelessWidget {
  const BookingStatusScreen({super.key});

  final List<Map<String, String>> bookings = const [
    {
      'service': 'EV Charging Slot',
      'provider': 'EcoCharge Hub',
      'time': 'Today • 10:00 AM',
      'status': 'Accepted',
    },
    {
      'service': 'Parking Slot',
      'provider': 'City Center Parking',
      'time': 'Today • 01:00 PM',
      'status': 'Pending',
    },
    {
      'service': 'Full Vehicle Wash',
      'provider': 'AutoCare Center',
      'time': 'Tomorrow • 09:00 AM',
      'status': 'Completed',
    },
  ];

  Color _statusColor(String status) {
    if (status == 'Accepted') return AppColors.availableGreen;
    if (status == 'Pending') return AppColors.limitedYellow;
    if (status == 'Completed') return AppColors.infoBlue;
    if (status == 'Cancelled') return AppColors.unavailableRed;
    return AppColors.deepNavy;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Booking Status'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          final color = _statusColor(booking['status']!);

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardWhite,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.confirmation_number,
                  color: AppColors.primaryOrange,
                  size: 34,
                ),
                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking['service']!,
                        style: const TextStyle(
                          color: AppColors.deepNavy,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        booking['provider']!,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        booking['time']!,
                        style: const TextStyle(
                          color: AppColors.deepNavy,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    booking['status']!,
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
        },
      ),
    );
  }
}