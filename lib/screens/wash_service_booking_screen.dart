import 'package:flutter/material.dart';
import '../models/wash_service_model.dart';
import '../theme/app_colors.dart';

class WashServiceBookingScreen extends StatefulWidget {
  final WashServiceModel service;

  const WashServiceBookingScreen({
    super.key,
    required this.service,
  });

  @override
  State<WashServiceBookingScreen> createState() =>
      _WashServiceBookingScreenState();
}

class _WashServiceBookingScreenState extends State<WashServiceBookingScreen> {
  String selectedDate = 'Today';
  String selectedTime = '09:00 AM';

  final List<String> dates = ['Today', 'Tomorrow', 'Jul 04'];
  final List<String> times = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '01:00 PM',
    '03:00 PM',
    '05:00 PM',
  ];

  final TextEditingController vehicleNumberController =
      TextEditingController();

  @override
  void dispose() {
    vehicleNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Book Service'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _serviceCard(),

              const SizedBox(height: 22),

              _sectionTitle('Vehicle Number'),
              const SizedBox(height: 10),
              TextField(
                controller: vehicleNumberController,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  hintText: 'Example: ABC-1234',
                  filled: true,
                  fillColor: AppColors.cardWhite,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle('Select Date'),
              const SizedBox(height: 12),
              _choiceWrap(dates, selectedDate, (value) {
                setState(() => selectedDate = value);
              }),

              const SizedBox(height: 22),

              _sectionTitle('Select Time Slot'),
              const SizedBox(height: 12),
              _choiceWrap(times, selectedTime, (value) {
                setState(() => selectedTime = value);
              }),

              const SizedBox(height: 22),

              _summaryCard(),

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
                    if (vehicleNumberController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter vehicle number'),
                        ),
                      );
                      return;
                    }

                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Service Booked'),
                        content: Text(
                          '${widget.service.name} is booked for vehicle ${vehicleNumberController.text.trim()} on $selectedDate at $selectedTime.',
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
                    'Confirm Service Booking',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
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

  Widget _serviceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            widget.service.type == 'Detailing'
                ? Icons.cleaning_services
                : Icons.local_car_wash,
            color: AppColors.primaryOrange,
            size: 36,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.service.name,
                  style: const TextStyle(
                    color: AppColors.deepNavy,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${widget.service.duration} • ${widget.service.price}',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _summaryCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.deepNavy,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Payment Status',
            style: TextStyle(color: Colors.white70),
          ),
          Text(
            'Pending • ${widget.service.price}',
            style: const TextStyle(
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