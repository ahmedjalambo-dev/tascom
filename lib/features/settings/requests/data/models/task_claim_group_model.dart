import 'package:tascom/features/settings/requests/data/models/claimer_model.dart';

class TaskClaimGroupModel {
  final String taskId;
  final String taskTitle;
  final DateTime taskPostedAt;
  final int taskPoints;
  final List<ClaimerModel> claimers;

  const TaskClaimGroupModel({
    required this.taskId,
    required this.taskTitle,
    required this.taskPostedAt,
    required this.taskPoints,
    required this.claimers,
  });

  int get pendingCount => claimers.length;

  TaskClaimGroupModel copyWithoutClaimer(String claimerId) {
    return TaskClaimGroupModel(
      taskId: taskId,
      taskTitle: taskTitle,
      taskPostedAt: taskPostedAt,
      taskPoints: taskPoints,
      claimers: claimers.where((c) => c.id != claimerId).toList(),
    );
  }
}
