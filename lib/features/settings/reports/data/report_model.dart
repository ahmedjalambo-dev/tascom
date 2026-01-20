class ReportModel {
  final String id;
  final String title;
  final String imageUrl;
  final String reportedDate;
  final String status;
  final String reason;

  ReportModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.reportedDate,
    required this.status,
    required this.reason,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      reportedDate: json['reportedDate'] ?? '',
      status: json['status'] ?? 'Pending',
      reason: json['reason'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'reportedDate': reportedDate,
      'status': status,
      'reason': reason,
    };
  }
}
