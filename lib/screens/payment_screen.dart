import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../theme/app_colors.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedMethod = 'Card';

  final List<TransactionModel> transactions = [
    TransactionModel(
      serviceName: 'EV Charging Slot',
      amount: 'LKR 1200',
      date: 'Jul 01',
      status: 'Paid',
    ),
    TransactionModel(
      serviceName: 'Parking Booking',
      amount: 'LKR 450',
      date: 'Jul 01',
      status: 'Pending',
    ),
    TransactionModel(
      serviceName: 'Vehicle Wash',
      amount: 'LKR 1500',
      date: 'Jun 30',
      status: 'Refunded',
    ),
  ];

  Color _statusColor(String status) {
    if (status == 'Paid') return AppColors.availableGreen;
    if (status == 'Pending') return AppColors.limitedYellow;
    if (status == 'Refunded') return AppColors.infoBlue;
    return AppColors.unavailableRed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Payments'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.deepNavy,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _paymentSummaryCard(),

          const SizedBox(height: 24),

          _sectionTitle('Payment Method'),
          const SizedBox(height: 12),

          Row(
            children: [
              _methodChip('Card', Icons.credit_card),
              const SizedBox(width: 10),
              _methodChip('Cash', Icons.money),
              const SizedBox(width: 10),
              _methodChip('Wallet', Icons.account_balance_wallet),
            ],
          ),

          const SizedBox(height: 26),

          _sectionTitle('Transaction History'),
          const SizedBox(height: 12),

          ListView.builder(
            itemCount: transactions.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final tx = transactions[index];
              final color = _statusColor(tx.status);

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.receipt_long,
                      color: AppColors.primaryOrange,
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.serviceName,
                            style: const TextStyle(
                              color: AppColors.deepNavy,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${tx.date} • ${tx.amount}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
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
                        tx.status,
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
        ],
      ),
    );
  }

  Widget _paymentSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.deepNavy,
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.payments,
            color: AppColors.primaryOrange,
            size: 42,
          ),
          SizedBox(height: 14),
          Text(
            'Total Paid',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 6),
          Text(
            'LKR 18,450',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _methodChip(String method, IconData icon) {
    final bool selected = selectedMethod == method;

    return Expanded(
      child: ChoiceChip(
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 17,
              color: selected ? Colors.white : AppColors.deepNavy,
            ),
            const SizedBox(width: 5),
            Text(method),
          ],
        ),
        selected: selected,
        selectedColor: AppColors.primaryOrange,
        labelStyle: TextStyle(
          color: selected ? Colors.white : AppColors.deepNavy,
          fontWeight: FontWeight.w600,
        ),
        onSelected: (_) {
          setState(() => selectedMethod = method);
        },
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