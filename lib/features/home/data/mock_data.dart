import 'models/category_model.dart';
import 'models/task_model.dart';

/// Mock categories for the home screen filter.
final List<CategoryModel> mockCategories = [
  const CategoryModel(
    id: 'all',
    name: 'View All',
    iconPath: 'assets/icons/post-categories/view-all.svg',
  ),
  const CategoryModel(
    id: 'errands',
    name: 'Errands',
    iconPath: 'assets/icons/post-categories/errands.svg',
  ),
  const CategoryModel(
    id: 'repairs',
    name: 'Repairs',
    iconPath: 'assets/icons/post-categories/repairs.svg',
  ),
  const CategoryModel(
    id: 'home-services',
    name: 'Home Services',
    iconPath: 'assets/icons/post-categories/home-services.svg',
  ),
  const CategoryModel(
    id: 'transportation',
    name: 'Transportation',
    iconPath: 'assets/icons/post-categories/transportation.svg',
  ),
  const CategoryModel(
    id: 'pet-care',
    name: 'Pet Care',
    iconPath: 'assets/icons/post-categories/pet-care.svg',
  ),
];

/// Mock tasks for the home screen feed.
final List<TaskModel> mockTasks = [
  TaskModel(
    id: '1',
    title: 'Help with Apartment Cleaning',
    description:
        "I'm looking for someone to help me clean my apartment for a few hours.\n\nThe tasks include basic cleaning like dusting, mopping, and organizing common areas.",
    authorName: 'Lina Hassan',
    authorRating: 4.2,
    createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    category: 'Home Services',
    priority: TaskPriority.medium,
    location: 'Al-Rimal St.',
    duration: '1 day',
    points: 30,
    imageUrl:
        'https://images.unsplash.com/photo-1581578731548-c64695cc6952?w=400',
    likesCount: 30,
    commentsCount: 10,
    isLiked: false,
    isBookmarked: false,
  ),
  TaskModel(
    id: '2',
    title: 'Fix a Broken Door Handle',
    description:
        'The door handle in my apartment has become loose and is no longer functioning properly.\n\nI need someone experienced to fix or replace it to ensure the door works smoothly again.',
    authorName: 'Ahmed Khaled',
    authorRating: 4.5,
    createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    category: 'Repairs',
    priority: TaskPriority.high,
    location: 'Downtown Market',
    duration: '3 days',
    points: 44,
    imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400',
    likesCount: 30,
    commentsCount: 10,
    isLiked: true,
    isBookmarked: true,
  ),
  TaskModel(
    id: '3',
    title: 'Grocery Shopping Assistance',
    description:
        'Need someone to help with weekly grocery shopping. The store is about 2km away and I need help carrying the bags.',
    authorName: 'Sara Mohamed',
    authorRating: 4.8,
    createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    category: 'Errands',
    priority: TaskPriority.low,
    location: 'City Center',
    duration: '2 hours',
    points: 15,
    likesCount: 12,
    commentsCount: 3,
    isLiked: false,
    isBookmarked: false,
  ),
];
