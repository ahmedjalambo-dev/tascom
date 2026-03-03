import 'package:tascom/features/home/data/models/comment.dart';

final List<Comment> mockComments = [
  Comment(
    id: '1',
    userName: 'Helper Name',
    userAvatar: 'https://i.pravatar.cc/150?img=3',
    createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    location: 'Downtown Market',
    content:
        "I can help with this task today. I've done similar errands in the neighborhood before and I'm available this afternoon.",
    replies: [
      Comment(
        id: '2',
        userName: 'Ahmed Khaled',
        userAvatar: 'https://i.pravatar.cc/150?img=8',
        createdAt: DateTime.now().subtract(const Duration(minutes: 55)),
        content:
            "Perfect, that works for me. I'll go ahead and claim the task now.",
        isAuthor: true,
      ),
    ],
  ),
];
