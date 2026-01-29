class FilterCategory {
  final String id;
  final String title;
  final String icon;
  final bool isViewAll;

  const FilterCategory({
    required this.id,
    required this.title,
    required this.icon,
    this.isViewAll = false,
  });
}
