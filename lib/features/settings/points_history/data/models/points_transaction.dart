import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';

enum TransactionStatus {
  completed,
  cancelled,
}

extension TransactionStatusExtension on TransactionStatus {
  String get displayName {
    switch (this) {
      case TransactionStatus.completed:
        return 'Completed';
      case TransactionStatus.cancelled:
        return 'Canceled';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case TransactionStatus.completed:
        return MyColors.brand.purple.withValues(alpha: 0.1);
      case TransactionStatus.cancelled:
        return MyColors.status.cancelled.withValues(alpha: 0.1);
    }
  }

  Color get textColor {
    switch (this) {
      case TransactionStatus.completed:
        return MyColors.brand.purple;
      case TransactionStatus.cancelled:
        return MyColors.status.cancelled;
    }
  }
}

class PointsTransaction {
  final String id;
  final String taskName;
  final DateTime date;
  final TransactionStatus status;
  final int points;

  const PointsTransaction({
    required this.id,
    required this.taskName,
    required this.date,
    required this.status,
    required this.points,
  });

  bool get isEarned => points > 0;
}
