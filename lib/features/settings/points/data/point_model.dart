enum PointStatus { completed, cancelled }

class PointModel {
  final String id;
  final String taskName;
  final String date;
  final int points;
  final PointStatus status;
  final bool isNegative;

  const PointModel({
    required this.id,
    required this.taskName,
    required this.date,
    required this.points,
    required this.status,
    this.isNegative = false,
  });
}
