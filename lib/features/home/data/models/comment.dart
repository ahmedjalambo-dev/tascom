import 'package:tascom/core/helpers/time_helper.dart';

class Comment {
  final String id;
  final String userName;
  final String? userAvatar;
  final DateTime createdAt;
  final String? location;
  final String content;
  final bool isAuthor;
  final List<Comment> replies;

  const Comment({
    required this.id,
    required this.userName,
    this.userAvatar,
    required this.createdAt,
    this.location,
    required this.content,
    this.isAuthor = false,
    this.replies = const [],
  });

  String get timeAgo => calculateTimeAgo(createdAt);
}
