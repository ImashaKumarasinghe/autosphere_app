import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AvailabilityManagementScreen extends StatefulWidget {
  const AvailabilityManagementScreen({super.key});

  @override
  State<AvailabilityManagementScreen> createState() =>
      _AvailabilityManagementScreenState();
}

class _AvailabilityManagementScreenState
    extends State<AvailabilityManagementScreen> {
  bool petrolAvailable = true;
  bool dieselAvailable = true;
  bool evChargerAvailable = true;
  bool parkingAvailable = true;
  bool washSlotsAvailable = true;

  int evSlots = 4;
  int parkingSlots = 12;
  int washSlots = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Availability Management'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle('Fuel Availability'),
          _switchTile(
            title: 'Petrol Available',
            subtitle: 'Customers can view petrol availability',
            value: petrolAvailable,
            onChanged: (value) {
              setState(() => petrolAvailable = value);
            },
          ),
          _switchTile(
            title: 'Diesel Available',
            subtitle: 'Customers can view diesel availability',
            value: dieselAvailable,
            onChanged: (value) {
              setState(() => dieselAvailable = value);
            },
          ),

          const SizedBox(height: 20),

          _sectionTitle('EV Charging Availability'),
          _switchTile(
            title: 'EV Chargers Available',
            subtitle: '$evSlots charging slots available',
            value: evChargerAvailable,
            onChanged: (value) {
              setState(() => evChargerAvailable = value);
            },
          ),
          _counterCard(
            title: 'EV Charging Slots',
            value: evSlots,
            onAdd: () {
              setState(() => evSlots++);
            },
            onRemove: () {
              if (evSlots > 0) {
                setState(() => evSlots--);
              }
            },
          ),

          const SizedBox(height: 20),

          _sectionTitle('Parking Availability'),
          _switchTile(
            title: 'Parking Available',
            subtitle: '$parkingSlots parking spaces available',
            value: parkingAvailable,
            onChanged: (value) {
              setState(() => parkingAvailable = value);
            },
          ),
          _counterCard(
            title: 'Parking Slots',
            value: parkingSlots,
            onAdd: () {
              setState(() => parkingSlots++);
            },
            onRemove: () {
              if (parkingSlots > 0) {
                setState(() => parkingSlots--);
              }
            },
          ),

          const SizedBox(height: 20),

          _sectionTitle('Wash Center Availability'),
          _switchTile(
            title: 'Wash Slots Available',
            subtitle: '$washSlots time slots available today',
            value: washSlotsAvailable,
            onChanged: (value) {
              setState(() => washSlotsAvailable = value);
            },
          ),
          _counterCard(
            title: 'Wash Time Slots',
            value: washSlots,
            onAdd: () {
              setState(() => washSlots++);
            },
            onRemove: () {
              if (washSlots > 0) {
                setState(() => washSlots--);
              }
            },
          ),

          const SizedBox(height: 24),

          SizedBox(
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Availability updated successfully'),
                  ),
                );
              },
              child: const Text(
                'Save Availability',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _switchTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            value ? Icons.check_circle : Icons.cancel,
            color: value ? AppColors.availableGreen : AppColors.unavailableRed,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.deepNavy,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            activeColor: AppColors.primaryOrange,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _counterCard({
    required String title,
    required int value,
    required VoidCallback onAdd,
    required VoidCallback onRemove,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.deepNavy,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.remove_circle_outline),
            color: AppColors.unavailableRed,
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              color: AppColors.deepNavy,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: onAdd,
            icon: const Icon(Icons.add_circle_outline),
            color: AppColors.availableGreen,
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