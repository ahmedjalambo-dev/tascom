import 'package:tascom/features/home/data/models/task_category.dart';

class RecentSearchItem {
  final String text;
  final TaskCategory category;

  const RecentSearchItem({required this.text, required this.category});
}

const List<RecentSearchItem> mockRecentSearches = [
  RecentSearchItem(text: 'Pet Care', category: TaskCategory.pet),
  RecentSearchItem(text: 'Furniture Repair', category: TaskCategory.repairs),
  RecentSearchItem(
    text: 'Shipping to an address',
    category: TaskCategory.transportation,
  ),
  RecentSearchItem(text: 'Teaching a skill', category: TaskCategory.teaching),
];
