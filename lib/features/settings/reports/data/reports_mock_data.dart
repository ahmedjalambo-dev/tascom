import 'package:tascom/features/settings/reports/data/models/report_model.dart';

class ReportsData {
  static final List<Report> reports = [
    Report(
      id: '1',
      taskTitle: 'Gardening Help Needed for My Backyard',
      taskImageUrl: 'assets/images/cleaning_task.png',
      reportedAt: DateTime(2025, 10, 12),
      status: ReportStatus.pending,
      reason: 'Inappropriate or offensive content',
      reportId: '#1839',
    ),
    Report(
      id: '2',
      taskTitle: 'Need Someone to Take Care of My Cat',
      taskImageUrl: 'assets/images/door_handle_task.png',
      reportedAt: DateTime(2025, 5, 9),
      status: ReportStatus.resolved,
      reason: 'Inappropriate or offensive content',
      reportId: '#1839',
    ),
  ];
}
