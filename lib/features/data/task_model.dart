class TaskModel {
  final String id;
  final String title;
  final String description;
  final String status;
  final String category;
  final String imageUrl;
  final String location;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.category,
    required this.imageUrl,
    required this.location,
  });
}
