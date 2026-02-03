import 'package:tascom/features/settings/points_history/data/models/points_transaction.dart';

class PointsHistoryData {
  static const int totalBalance = 5385;

  static final List<PointsTransaction> transactions = [
    PointsTransaction(
      id: '1',
      taskName: 'Task Name',
      date: DateTime.now().copyWith(hour: 14, minute: 30),
      status: TransactionStatus.completed,
      points: 30,
    ),
    PointsTransaction(
      id: '2',
      taskName: 'Task Name',
      date: DateTime(2025, 10, 24),
      status: TransactionStatus.cancelled,
      points: -26,
    ),
    PointsTransaction(
      id: '3',
      taskName: 'Task Name',
      date: DateTime(2025, 10, 5),
      status: TransactionStatus.completed,
      points: 40,
    ),
    PointsTransaction(
      id: '4',
      taskName: 'Task Name',
      date: DateTime(2025, 10, 5),
      status: TransactionStatus.completed,
      points: 40,
    ),
  ];
}
