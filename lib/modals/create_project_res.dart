// Model for response
class CreateProjectRes {
  bool success;
  String message;
  String? projectId;

  CreateProjectRes(
      {required this.success, required this.message, this.projectId});

  // Convert JSON response to `CreateProjectRes` object
  factory CreateProjectRes.fromJson(Map<String, dynamic> json) {
    return CreateProjectRes(
      success: json['success'] ?? false,
      message: json['message'] ?? "Something went wrong",
      projectId: json['projectId'],
    );
  }

  // Serialize to JSON (useful for debugging)
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'projectId': projectId,
    };
  }
}
