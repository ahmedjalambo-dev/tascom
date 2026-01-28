import 'package:tascom/features/profile/data/profile_model.dart';
import 'package:tascom/features/profile/data/task_model.dart';
import 'package:tascom/features/profile/utils/task_constants.dart';

/// Mock data provider for the profile feature.
/// This should be replaced with real API calls in production.
class MockProfileData {
  /// Mock profile data for the current user.
  static const ProfileModel profile = ProfileModel(
    name: "Sara Mahdi",
    avatarUrl: "https://i.pravatar.cc/300?img=5",
    rating: 4.5,
    reviewCount: 120,
    points: 5375,
    postedCount: 30,
    claimedCount: 15,
    completedCount: 65,
  );

  /// Mock tasks list for the current user.
  static final List<TaskModel> tasks = [
    const TaskModel(
      id: "1",
      title: "Help move boxes",
      timeAgo: "2 days ago",
      status: TaskStatus.active,
      category: "Home Services",
      location: "Nablus, Palestine",
      isPostedByMe: true,
    ),
    const TaskModel(
      id: "2",
      title: "Help move boxes",
      timeAgo: "2 days ago",
      status: TaskStatus.inProgress,
      helperName: "Ali Rayyan",
      posterName: "Ali Rayyan",
      category: "Home Services",
      location: "Palestine, Nablus",
      isPostedByMe: true,
    ),
    const TaskModel(
      id: "3",
      title: "Help move boxes",
      timeAgo: "2 days ago",
      status: TaskStatus.completed,
      helperName: "Ali Rayyan",
      posterName: "Ali Rayyan",
      category: "Home Services",
      location: "Nablus, Palestine",
      isPostedByMe: true,
    ),
    const TaskModel(
      id: "4",
      title: "Help move boxes",
      timeAgo: "25/12/2025",
      status: TaskStatus.canceled,
      helperName: "Ali Rayyan",
      posterName: "Ali Rayyan",
      category: "Home Services",
      location: "Palestine, Nablus",
      isPostedByMe: true,
    ),
  ];

  MockProfileData._();
}
