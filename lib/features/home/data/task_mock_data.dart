import 'package:tascom/features/home/data/comments_mock_data.dart';
import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_location.dart';
import 'package:tascom/features/home/data/models/task_metrics.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';
import 'package:tascom/features/home/data/models/task_status.dart';
import 'package:tascom/features/home/data/models/user_model.dart';

final List<TaskModel> mockTaskPosts = [
  TaskModel(
    id: '1',
    author: const UserModel(
      id: 'u2',
      name: 'Lina Hassan',
      avatar: null,
      rating: 4.2,
    ),
    createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    title: 'Help with Apartment Cleaning',
    description:
        "I'm looking for someone to help me clean my apartment for a few hours.\n\nThe tasks include basic cleaning like dusting, mopping, and organizing common areas.",
    category: TaskCategory.homeService,
    priority: TaskPriority.medium,
    status: TaskStatus.open,
    location: const TaskLocation(name: 'Al-Rimal St.'),
    duration: '1 day',
    metrics: const TaskMetrics(points: 30, distance: 5),
    likeCount: 30,
    commentCount: 10,
    imageUrl: 'assets/images/cleaning_task.png',
  ),
  TaskModel(
    id: '2',
    author: const UserModel(
      id: 'u1',
      name: 'Ahmed Khaled',
      avatar: null,
      rating: 4.5,
    ),
    createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    title: 'Fix a Broken Door Handle',
    description:
        "The door handle in my apartment has become loose and is no longer functioning properly.\n\nI need someone experienced to fix or replace it to ensure the door works smoothly again.",
    category: TaskCategory.repairs,
    priority: TaskPriority.high,
    status: TaskStatus.open,
    location: const TaskLocation(name: 'Downtown Market'),
    duration: '3 days',
    metrics: const TaskMetrics(points: 44, distance: 10),
    likeCount: 30,
    commentCount: 10,
    comments: mockComments,
    imageUrl: 'assets/images/door_handle_task.png',
  ),
];

// Single mock task matching the UI requirements
final TaskModel mockTask = mockTaskPosts[1];
