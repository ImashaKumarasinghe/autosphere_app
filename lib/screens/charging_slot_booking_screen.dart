import 'package:flutter/material.dart';
import '../models/ev_station_model.dart';
import '../theme/app_colors.dart';

class ChargingSlotBookingScreen extends StatefulWidget {
  final EvStationModel station;

  const ChargingSlotBookingScreen({
    super.key,
    required this.station,
  });

  @override
  State<ChargingSlotBookingScreen> createState() =>
      _ChargingSlotBookingScreenState();
}

class _ChargingSlotBookingScreenState extends State<ChargingSlotBookingScreen> {
  String selectedDate = 'Today';
  String selectedTime = '10:00 AM';

  final List<String> dates = ['Today', 'Tomorrow', 'Jul 04'];
  final List<String> times = [
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '02:00 PM',
    '04:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Book Charging Slot'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _stationCard(),

            const SizedBox(height: 24),

            _sectionTitle('Select Date'),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              children: dates.map((date) {
                final bool isSelected = selectedDate == date;

                return ChoiceChip(
                  label: Text(date),
                  selected: isSelected,
                  selectedColor: AppColors.primaryOrange,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.deepNavy,
                    fontWeight: FontWeight.w600,
                  ),
                  onSelected: (_) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            _sectionTitle('Select Time Slot'),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: times.map((time) {
                final bool isSelected = selectedTime == time;

                return ChoiceChip(
                  label: Text(time),
                  selected: isSelected,
                  selectedColor: AppColors.primaryOrange,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.deepNavy,
                    fontWeight: FontWeight.w600,
                  ),
                  onSelected: (_) {
                    setState(() {
                      selectedTime = time;
                    });
                  },
                );
              }).toList(),
            ),

            const Spacer(),

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
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Booking Confirmed'),
                      content: Text(
                        'Your charging slot at ${widget.station.name} is booked for $selectedDate at $selectedTime.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        )
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _stationCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.electric_car,
            color: AppColors.infoBlue,
            size: 36,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.station.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.deepNavy,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${widget.station.chargerType} • ${widget.station.price}',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          )
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