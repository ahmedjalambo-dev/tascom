import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_location.dart';
import 'package:tascom/features/home/data/models/task_metrics.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';
import 'package:tascom/features/home/data/models/task_status.dart';
import 'package:tascom/features/home/data/models/user_model.dart';

/// Current user profile data
class ProfileData {
  static const currentUser = UserModel(
    id: 'user_001',
    name: 'Sara Mahdi',
    avatar: 'https://i.pravatar.cc/150?img=5',
    rating: 4.5,
  );

  static const int reviewCount = 120;
  static const int points = 5375;
  static const int postedCount = 30;
  static const int claimedCount = 15;
  static const int completedCount = 65;
}

/// Sample helper users
const _helperAliRayyan = UserModel(
  id: 'user_002',
  name: 'Ali Rayyan',
  avatar: 'https://i.pravatar.cc/150?img=12',
  rating: 4.8,
);

const _helperAliAhmad = UserModel(
  id: 'user_003',
  name: 'Ali Ahmad',
  avatar: 'https://i.pravatar.cc/150?img=8',
  rating: 4.2,
);

/// Posted tasks (tasks the user has created)
final List<TaskModel> postedTasksMockData = [
  // Active task - waiting for applicants
  TaskModel(
    id: 'posted_001',
    author: ProfileData.currentUser,
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
    title: 'Help move boxes',
    description: 'Need help moving some boxes from my apartment to storage.',
    category: TaskCategory.homeService,
    priority: TaskPriority.medium,
    status: TaskStatus.active,
    location: const TaskLocation(name: 'Nablus, Palestine'),
    duration: '2-3 hours',
    metrics: const TaskMetrics(points: 300, distance: 2.5),
    likeCount: 5,
    commentCount: 3,
  ),

  // In Progress task - helper assigned
  TaskModel(
    id: 'posted_002',
    author: ProfileData.currentUser,
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
    title: 'Help move boxes',
    description: 'Need help moving furniture to new apartment.',
    category: TaskCategory.homeService,
    priority: TaskPriority.high,
    status: TaskStatus.inProgress,
    location: const TaskLocation(name: 'Palestine, Nablus'),
    duration: '4-5 hours',
    metrics: const TaskMetrics(points: 500, distance: 3.0),
    likeCount: 8,
    commentCount: 5,
    helper: _helperAliRayyan,
  ),

  // Completed task
  TaskModel(
    id: 'posted_003',
    author: ProfileData.currentUser,
    createdAt: DateTime.now().subtract(const Duration(days: 60)),
    title: 'Help move boxes',
    description: 'Moved all items successfully.',
    category: TaskCategory.homeService,
    priority: TaskPriority.low,
    status: TaskStatus.completed,
    location: const TaskLocation(name: 'Nablus, Palestine'),
    duration: '3 hours',
    metrics: const TaskMetrics(points: 300, distance: 1.5),
    likeCount: 12,
    commentCount: 7,
    helper: _helperAliAhmad,
  ),
];

/// Claimed tasks (tasks the user has claimed to help with)
final List<TaskModel> claimedTasksMockData = [
  // In Progress - user is helping
  TaskModel(
    id: 'claimed_001',
    author: _helperAliRayyan,
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
    title: 'Help move boxes',
    description: 'Need assistance with moving.',
    category: TaskCategory.homeService,
    priority: TaskPriority.medium,
    status: TaskStatus.inProgress,
    location: const TaskLocation(name: 'Palestine, Nablus'),
    duration: '2-3 hours',
    metrics: const TaskMetrics(points: 300, distance: 2.0),
    likeCount: 4,
    commentCount: 2,
    helper: ProfileData.currentUser,
  ),

  // Cancelled task
  TaskModel(
    id: 'claimed_002',
    author: _helperAliRayyan,
    createdAt: DateTime.now().subtract(const Duration(days: 30)),
    title: 'Help move boxes',
    description: 'Task was cancelled due to schedule conflict.',
    category: TaskCategory.homeService,
    priority: TaskPriority.low,
    status: TaskStatus.cancelled,
    location: const TaskLocation(name: 'Palestine, Nablus'),
    duration: '2 hours',
    metrics: const TaskMetrics(points: 300, distance: 1.0),
    likeCount: 2,
    commentCount: 1,
    helper: ProfileData.currentUser,
    cancelledAt: DateTime(2025, 12, 25),
  ),
];
