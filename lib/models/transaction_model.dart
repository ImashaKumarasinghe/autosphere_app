class TransactionModel {
  final String serviceName;
  final String amount;
  final String date;
  final String status;

  TransactionModel({
    required this.serviceName,
    required this.amount,
    required this.date,
    required this.status,
  });
}