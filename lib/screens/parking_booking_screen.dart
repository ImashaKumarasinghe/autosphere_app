import 'package:flutter/material.dart';
import '../models/parking_model.dart';
import '../theme/app_colors.dart';

class ParkingBookingScreen extends StatefulWidget {
  final ParkingModel parking;

  const ParkingBookingScreen({
    super.key,
    required this.parking,
  });

  @override
  State<ParkingBookingScreen> createState() => _ParkingBookingScreenState();
}

class _ParkingBookingScreenState extends State<ParkingBookingScreen> {
  String selectedDate = 'Today';
  String selectedStartTime = '09:00 AM';
  String selectedDuration = '1 Hour';

  final List<String> dates = ['Today', 'Tomorrow', 'Jul 04'];
  final List<String> times = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '01:00 PM',
    '03:00 PM',
    '05:00 PM',
  ];

  final List<String> durations = [
    '1 Hour',
    '2 Hours',
    '3 Hours',
    'Full Day',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Parking Booking'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _parkingCard(),
            const SizedBox(height: 22),

            _sectionTitle('Select Date'),
            const SizedBox(height: 12),
            _choiceWrap(dates, selectedDate, (value) {
              setState(() => selectedDate = value);
            }),

            const SizedBox(height: 22),

            _sectionTitle('Start Time'),
            const SizedBox(height: 12),
            _choiceWrap(times, selectedStartTime, (value) {
              setState(() => selectedStartTime = value);
            }),

            const SizedBox(height: 22),

            _sectionTitle('Duration'),
            const SizedBox(height: 12),
            _choiceWrap(durations, selectedDuration, (value) {
              setState(() => selectedDuration = value);
            }),

            const Spacer(),

            _paymentSummary(),

            const SizedBox(height: 12),

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
                      title: const Text('Parking Booked'),
                      content: Text(
                        'Your parking slot at ${widget.parking.name} is booked for $selectedDate at $selectedStartTime for $selectedDuration.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Confirm & Continue to Payment',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _choiceWrap(
    List<String> items,
    String selectedValue,
    Function(String) onSelected,
  ) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: items.map((item) {
        final bool isSelected = selectedValue == item;

        return ChoiceChip(
          label: Text(item),
          selected: isSelected,
          selectedColor: AppColors.primaryOrange,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : AppColors.deepNavy,
            fontWeight: FontWeight.w600,
          ),
          onSelected: (_) => onSelected(item),
        );
      }).toList(),
    );
  }

  Widget _parkingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.local_parking,
            color: AppColors.primaryOrange,
            size: 36,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.parking.name,
                  style: const TextStyle(
                    color: AppColors.deepNavy,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${widget.parking.location} • ${widget.parking.pricePerHour}',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _paymentSummary() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.deepNavy,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Payment Status',
            style: TextStyle(color: Colors.white70),
          ),
          Text(
            'Pending',
            style: TextStyle(
              color: AppColors.limitedYellow,
              fontWeight: FontWeight.bold,
            ),
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