import 'package:flutter/material.dart';
import '../models/promotion_model.dart';
import '../theme/app_colors.dart';

class OfferManagementScreen extends StatefulWidget {
  const OfferManagementScreen({super.key});

  @override
  State<OfferManagementScreen> createState() => _OfferManagementScreenState();
}

class _OfferManagementScreenState extends State<OfferManagementScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<PromotionModel> promotions = [
    PromotionModel(
      title: '20% Off Full Wash',
      description: 'Special discount for full vehicle wash packages.',
      startDate: 'Jul 01',
      endDate: 'Jul 10',
      status: 'Active',
    ),
    PromotionModel(
      title: 'Parking Weekend Deal',
      description: 'Book 3 hours and get 1 hour free.',
      startDate: 'Jul 05',
      endDate: 'Jul 15',
      status: 'Scheduled',
    ),
  ];

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _addPromotion() {
    if (titleController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter offer title and description')),
      );
      return;
    }

    setState(() {
      promotions.insert(
        0,
        PromotionModel(
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          startDate: 'Today',
          endDate: 'Jul 20',
          status: 'Active',
        ),
      );

      titleController.clear();
      descriptionController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Offer added successfully')),
    );
  }

  Color _statusColor(String status) {
    if (status == 'Active') return AppColors.availableGreen;
    if (status == 'Scheduled') return AppColors.infoBlue;
    return AppColors.unavailableRed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Offer Management'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle('Create New Offer'),
          const SizedBox(height: 12),

          _inputField(
            controller: titleController,
            hint: 'Offer title',
            icon: Icons.local_offer,
          ),

          const SizedBox(height: 12),

          _inputField(
            controller: descriptionController,
            hint: 'Offer description',
            icon: Icons.description,
            maxLines: 3,
          ),

          const SizedBox(height: 14),

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
              onPressed: _addPromotion,
              child: const Text(
                'Add Offer',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 28),

          _sectionTitle('Active Promotions'),
          const SizedBox(height: 12),

          ListView.builder(
            itemCount: promotions.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final offer = promotions[index];
              final color = _statusColor(offer.status);

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.discount,
                      color: AppColors.primaryOrange,
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer.title,
                            style: const TextStyle(
                              color: AppColors.deepNavy,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            offer.description,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${offer.startDate} - ${offer.endDate}',
                            style: const TextStyle(
                              color: AppColors.deepNavy,
                              fontSize: 12,
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
                        color: color.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        offer.status,
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
          )
        ],
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: AppColors.cardWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
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