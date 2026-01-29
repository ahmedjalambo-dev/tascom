import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_post.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';

final List<TaskPost> mockTaskPosts = [
  const TaskPost(
    id: '1',
    userName: 'Lina Hassan',
    userAvatar: null,
    userRating: 4.2,
    timeAgo: '3h ago',
    title: 'Help with Apartment Cleaning',
    description:
        "I'm looking for someone to help me clean my apartment for a few hours.\n\nThe tasks include basic cleaning like dusting, mopping, and organizing common areas.",
    category: TaskCategory.homeService,
    priority: TaskPriority.medium,
    location: 'Al-Rimal St.',
    duration: '1 day',
    points: 30,
    likeCount: 30,
    commentCount: 10,
    imageUrl: 'assets/images/cleaning_task.png',
  ),
  const TaskPost(
    id: '2',
    userName: 'Ahmed Khaled',
    userAvatar: null,
    userRating: 4.5,
    timeAgo: '3h ago',
    title: 'Fix a Broken Door Handle',
    description:
        "The door handle in my apartment has become loose and is no longer functioning properly.\n\nI need someone experienced to fix or replace it to ensure the door works smoothly again.",
    category: TaskCategory.repairs,
    priority: TaskPriority.high,
    location: 'Downtown Market',
    duration: '3 days',
    points: 44,
    likeCount: 30,
    commentCount: 10,
    imageUrl: 'assets/images/door_handle_task.png',
  ),
];
