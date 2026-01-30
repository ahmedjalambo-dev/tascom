import 'package:tascom/features/home/data/models/comment.dart';

const List<Comment> mockComments = [
  Comment(
    id: '1',
    userName: 'Helper Name',
    userAvatar: 'https://i.pravatar.cc/150?img=3',
    timeAgo: '3h ago',
    location: 'Downtown Market',
    content:
        "I can help with this task today. I've done similar errands in the neighborhood before and I'm available this afternoon.",
    replies: [
      Comment(
        id: '2',
        userName: 'Ahmed Khaled',
        userAvatar: 'https://i.pravatar.cc/150?img=8',
        timeAgo: '55m ago',
        content:
            "Perfect, that works for me. I'll go ahead and claim the task now.",
        isAuthor: true,
      ),
    ],
  ),
];
