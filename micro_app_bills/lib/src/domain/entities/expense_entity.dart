class ExpenseEntity {
  final double value;
  final String name;
  final bool isRecurrent;
  final DateTime date;
  final bool isPaid;

  const ExpenseEntity({
    required this.date,
    required this.value,
    required this.name,
    required this.isRecurrent,
    required this.isPaid
  });
} 