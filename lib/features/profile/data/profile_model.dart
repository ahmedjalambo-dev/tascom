/// Model representing user profile data.
class ProfileModel {
  final String name;
  final String avatarUrl;
  final double rating;
  final int reviewCount;
  final int points;
  final int postedCount;
  final int claimedCount;
  final int completedCount;

  const ProfileModel({
    required this.name,
    required this.avatarUrl,
    required this.rating,
    required this.reviewCount,
    required this.points,
    required this.postedCount,
    required this.claimedCount,
    required this.completedCount,
  });

  /// Creates a copy of this profile with the given fields replaced with new values.
  ProfileModel copyWith({
    String? name,
    String? avatarUrl,
    double? rating,
    int? reviewCount,
    int? points,
    int? postedCount,
    int? claimedCount,
    int? completedCount,
  }) {
    return ProfileModel(
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      points: points ?? this.points,
      postedCount: postedCount ?? this.postedCount,
      claimedCount: claimedCount ?? this.claimedCount,
      completedCount: completedCount ?? this.completedCount,
    );
  }

  /// Creates a ProfileModel from a JSON map.
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'] as int,
      points: json['points'] as int,
      postedCount: json['postedCount'] as int,
      claimedCount: json['claimedCount'] as int,
      completedCount: json['completedCount'] as int,
    );
  }

  /// Converts this ProfileModel to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatarUrl': avatarUrl,
      'rating': rating,
      'reviewCount': reviewCount,
      'points': points,
      'postedCount': postedCount,
      'claimedCount': claimedCount,
      'completedCount': completedCount,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileModel &&
        other.name == name &&
        other.avatarUrl == avatarUrl &&
        other.rating == rating &&
        other.reviewCount == reviewCount &&
        other.points == points &&
        other.postedCount == postedCount &&
        other.claimedCount == claimedCount &&
        other.completedCount == completedCount;
  }

  @override
  int get hashCode {
    return Object.hash(
      name,
      avatarUrl,
      rating,
      reviewCount,
      points,
      postedCount,
      claimedCount,
      completedCount,
    );
  }

  @override
  String toString() {
    return 'ProfileModel(name: $name, avatarUrl: $avatarUrl, rating: $rating, '
        'reviewCount: $reviewCount, points: $points, postedCount: $postedCount, '
        'claimedCount: $claimedCount, completedCount: $completedCount)';
  }
}
