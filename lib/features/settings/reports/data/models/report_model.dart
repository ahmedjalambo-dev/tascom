import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';

enum ReportStatus { pending, resolved }

extension ReportStatusExtension on ReportStatus {
  String get displayName {
    switch (this) {
      case ReportStatus.pending:
        return 'Pending';
      case ReportStatus.resolved:
        return 'Resolved';
    }
  }

  Color get textColor {
    switch (this) {
      case ReportStatus.pending:
        return MyColors.status.pending;
      case ReportStatus.resolved:
        return MyColors.status.resolved;
    }
  }

  Color get backgroundColor => textColor;
}

class Report {
  final String id;
  final String taskTitle;
  final String taskImageUrl;
  final DateTime reportedAt;
  final ReportStatus status;
  final String reason;
  final String reportId;

  const Report({
    required this.id,
    required this.taskTitle,
    required this.taskImageUrl,
    required this.reportedAt,
    required this.status,
    required this.reason,
    required this.reportId,
  });
}
