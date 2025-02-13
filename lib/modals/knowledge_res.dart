class KnowledgeRes {
  GetKnowledgeCenterAPI? getKnowledgeCenterAPI;

  KnowledgeRes({this.getKnowledgeCenterAPI});

  KnowledgeRes.fromJson(Map<String, dynamic> json) {
    getKnowledgeCenterAPI = json['GetKnowledgeCenterAPI'] != null
        ? GetKnowledgeCenterAPI.fromJson(json['GetKnowledgeCenterAPI'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getKnowledgeCenterAPI != null) {
      data['GetKnowledgeCenterAPI'] = getKnowledgeCenterAPI!.toJson();
    }
    return data;
  }
}

class GetKnowledgeCenterAPI {
  String? errorCode;
  String? result;
  List<Response>? response;

  GetKnowledgeCenterAPI({this.errorCode, this.result, this.response});

  GetKnowledgeCenterAPI.fromJson(Map<String, dynamic> json) {
    errorCode = json['ErrorCode'];
    result = json['Result'];
    if (json['Response'] != null) {
      response = <Response>[];
      json['Response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ErrorCode'] = errorCode;
    data['Result'] = result;
    if (response != null) {
      data['Response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? name;
  String? videoLink;
  String? filePath;
  String? type;

  Response({this.name, this.videoLink, this.filePath, this.type});

  Response.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    videoLink = json['VideoLink'];
    filePath = json['FilePath'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['VideoLink'] = videoLink;
    data['FilePath'] = filePath;
    data['Type'] = type;
    return data;
  }
}