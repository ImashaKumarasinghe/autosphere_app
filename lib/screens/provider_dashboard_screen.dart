import 'package:flutter/material.dart';
import '../components/dashboard_stat_card.dart';
import '../components/provider_booking_card.dart';
import '../models/dashboard_stat_model.dart';
import '../models/provider_booking_model.dart';
import '../theme/app_colors.dart';
import 'availability_management_screen.dart';
import 'offer_management_screen.dart';
import 'reports_screen.dart';

class ProviderDashboardScreen extends StatelessWidget {
  const ProviderDashboardScreen({super.key});

  static final List<DashboardStatModel> stats = [
    DashboardStatModel(
      title: 'Today Bookings',
      value: '18',
      subtitle: '+4 from yesterday',
    ),
    DashboardStatModel(
      title: 'Customers',
      value: '126',
      subtitle: 'Active customers',
    ),
    DashboardStatModel(
      title: 'Revenue',
      value: 'LKR 42K',
      subtitle: 'Today earnings',
    ),
    DashboardStatModel(
      title: 'Rating',
      value: '4.8',
      subtitle: 'Based on reviews',
    ),
  ];

  static final List<ProviderBookingModel> bookings = [
    ProviderBookingModel(
      customerName: 'Kasun Perera',
      serviceName: 'Full Vehicle Wash',
      time: 'Today • 10:00 AM',
      status: 'Pending',
    ),
    ProviderBookingModel(
      customerName: 'Nimali Silva',
      serviceName: 'Parking Slot',
      time: 'Today • 11:30 AM',
      status: 'Accepted',
    ),
    ProviderBookingModel(
      customerName: 'Ruwan Fernando',
      serviceName: 'EV Charging',
      time: 'Today • 01:00 PM',
      status: 'Completed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.calendar_month,
      Icons.people,
      Icons.payments,
      Icons.star,
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Provider Dashboard'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _businessHeader(),

            const SizedBox(height: 18),

            Row(
  children: [
    Expanded(
      child: _quickActionCard(
        context,
        title: 'Availability',
        icon: Icons.event_available,
        screen: const AvailabilityManagementScreen(),
      ),
    ),
    const SizedBox(width: 12),
    Expanded(
      child: _quickActionCard(
        context,
        title: 'Offers',
        icon: Icons.local_offer,
        screen: const OfferManagementScreen(),
      ),
    ),
    const SizedBox(width: 12),
    Expanded(
      child: _quickActionCard(
        context,
        title: 'Reports',
        icon: Icons.analytics,
        screen: const ReportsScreen(),
      ),
    ),
  ],
),

            const SizedBox(height: 22),

            GridView.builder(
              itemCount: stats.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 1.25,
              ),
              itemBuilder: (context, index) {
                final stat = stats[index];

                return DashboardStatCard(
                  title: stat.title,
                  value: stat.value,
                  subtitle: stat.subtitle,
                  icon: icons[index],
                );
              },
            ),

            const SizedBox(height: 26),

            _availabilityCard(),

            const SizedBox(height: 26),

            _sectionTitle('Today’s Bookings'),

            const SizedBox(height: 14),

            ListView.builder(
              itemCount: bookings.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final booking = bookings[index];

                return ProviderBookingCard(
                  customerName: booking.customerName,
                  serviceName: booking.serviceName,
                  time: booking.time,
                  status: booking.status,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickActionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget screen,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardWhite,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primaryOrange, size: 30),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.deepNavy,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _businessHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.deepNavy,
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.store, color: AppColors.primaryOrange, size: 42),
          SizedBox(height: 14),
          Text(
            'AutoCare Service Center',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Vehicle Wash • Detailing • Parking',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _availabilityCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.availableGreen.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.check_circle,
              color: AppColors.availableGreen,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Availability Status',
                  style: TextStyle(
                    color: AppColors.deepNavy,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Open now • 8 slots available',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Switch(
            value: true,
            activeColor: AppColors.primaryOrange,
            onChanged: null,
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
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}