import 'package:tascom/features/settings/requests/data/models/claimer_model.dart';
import 'package:tascom/features/settings/requests/data/models/task_claim_group_model.dart';

class RequestsMockData {
  static List<TaskClaimGroupModel> get taskClaimGroups => [
    TaskClaimGroupModel(
      taskId: '1',
      taskTitle: 'Need Assistance with a Quick Errand',
      taskPostedAt: DateTime.now().subtract(const Duration(hours: 2)),
      taskPoints: 44,
      claimers: [
        ClaimerModel(
          id: '1',
          name: 'Jalal',
          tasksCompleted: 30,
          rating: 4.3,
          message: 'Help with Apartment Cleaning',
          claimedAt: DateTime.now().subtract(const Duration(minutes: 15)),
        ),
        ClaimerModel(
          id: '2',
          name: 'Ahmed',
          tasksCompleted: 30,
          rating: 4.3,
          message: 'Help with Apartment Cleaning',
          claimedAt: DateTime.now().subtract(const Duration(minutes: 15)),
        ),
        ClaimerModel(
          id: '3',
          name: 'Sara',
          tasksCompleted: 25,
          rating: 4.7,
          message: 'Available for quick errands',
          claimedAt: DateTime.now().subtract(const Duration(minutes: 30)),
        ),
      ],
    ),
  ];

  static int totalPendingCount(List<TaskClaimGroupModel> groups) {
    return groups.fold(0, (sum, g) => sum + g.pendingCount);
  }
}
