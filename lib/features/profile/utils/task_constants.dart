/// Constants for task statuses used throughout the profile feature.
class TaskStatus {
  static const String active = 'Active';
  static const String inProgress = 'In Progress';
  static const String completed = 'Completed';
  static const String canceled = 'Canceled';

  static const List<String> all = [
    active,
    inProgress,
    completed,
    canceled,
  ];

  TaskStatus._();
}

/// Constants for task filter options.
class TaskFilter {
  static const String all = 'All';
  static const String active = 'Active';
  static const String inProgress = 'In Progress';
  static const String completed = 'Completed';
  static const String canceled = 'Canceled';

  static const List<String> options = [
    all,
    active,
    inProgress,
    completed,
    canceled,
  ];

  TaskFilter._();
}
