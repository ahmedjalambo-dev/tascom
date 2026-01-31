class ProfileModel {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final String country;
  final String city;
  final String description;
  final List<String> skills;

  ProfileModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.country,
    required this.city,
    required this.description,
    required this.skills,
  });

  /// 🔹 From JSON (API)
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      rating: (json['rating'] as num).toDouble(),
      country: json['country'],
      city: json['city'],
      description: json['description'],
      skills: List<String>.from(json['skills']),
    );
  }

  /// 🔹 To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
      'rating': rating,
      'country': country,
      'city': city,
      'description': description,
      'skills': skills,
    };
  }

  /// 🔹 Helper
  String get location => '$country, $city';
}
