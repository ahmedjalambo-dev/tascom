class FilterCategory {
  final String id;
  final String title;
  final String selctedIcon;
  final String unSelctedIcon;
  final bool isViewAll;

  const FilterCategory({
    required this.id,
    required this.title,
    required this.selctedIcon,
    required this.unSelctedIcon,
    this.isViewAll = false,
  });
}
