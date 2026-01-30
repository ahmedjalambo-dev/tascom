class Comment {
  final String id;
  final String userName;
  final String? userAvatar;
  final String timeAgo;
  final String? location;
  final String content;
  final bool isAuthor;
  final List<Comment> replies;

  const Comment({
    required this.id,
    required this.userName,
    this.userAvatar,
    required this.timeAgo,
    this.location,
    required this.content,
    this.isAuthor = false,
    this.replies = const [],
  });
}
