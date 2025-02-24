import 'dart:io';

// Model for request
class CreateProjectReq {
  File? uploadedFile;

  CreateProjectReq({this.uploadedFile});

  // Deserialize JSON
  factory CreateProjectReq.fromJson(Map<String, dynamic> json) {
    return CreateProjectReq(
      uploadedFile:
          json['uploadedImage'] != null ? File(json['uploadedImage']) : null,
    );
  }

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'uploadedImage': uploadedFile
          ?.path, // Only passing the path as API might require a multipart file upload
    };
  }
}
