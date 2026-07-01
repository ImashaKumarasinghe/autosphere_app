import 'package:flutter/material.dart';
import '../models/notification_model.dart';
import '../theme/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const List<NotificationModel> notifications = [
    NotificationModel(
      title: 'Booking Confirmed',
      message: 'Your EV charging slot has been accepted.',
      time: '5 min ago',
      type: 'Booking',
    ),
    NotificationModel(
      title: 'New Offer Available',
      message: 'Get 20% off for full vehicle wash today.',
      time: '20 min ago',
      type: 'Offer',
    ),
    NotificationModel(
      title: 'Payment Update',
      message: 'Your parking payment is pending.',
      time: '1 hour ago',
      type: 'Payment',
    ),
    NotificationModel(
      title: 'New Booking Request',
      message: 'A customer requested a detailing service.',
      time: '2 hours ago',
      type: 'Provider',
    ),
  ];

  IconData _icon(String type) {
    if (type == 'Booking') return Icons.confirmation_number;
    if (type == 'Offer') return Icons.local_offer;
    if (type == 'Payment') return Icons.payments;
    return Icons.store;
  }

  Color _color(String type) {
    if (type == 'Booking') return AppColors.availableGreen;
    if (type == 'Offer') return AppColors.primaryOrange;
    if (type == 'Payment') return AppColors.infoBlue;
    return AppColors.limitedYellow;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          final color = _color(item.type);

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.cardWhite,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    _icon(item.type),
                    color: color,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          color: AppColors.deepNavy,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.message,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  item.time,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 11,
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