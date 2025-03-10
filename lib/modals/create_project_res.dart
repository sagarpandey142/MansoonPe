class CreateProjectRes {
  int? status;
  String? message;
  Data? data;
  String? timestamp;

  CreateProjectRes({this.status, this.message, this.data, this.timestamp});

  CreateProjectRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class Data {
  Project? project;

  Data({this.project});

  Data.fromJson(Map<String, dynamic> json) {
    project =
    json['project'] != null ? Project.fromJson(json['project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (project != null) {
      data['project'] = project!.toJson();
    }
    return data;
  }
}

class Project {
  int? id;
  String? name;
  String? location;
  String? contractFile;
  int? budget;
  String? status;
  String? createdOn;
  String? updatedOn;

  Project(
      {this.id,
        this.name,
        this.location,
        this.contractFile,
        this.budget,
        this.status,
        this.createdOn,
        this.updatedOn});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    contractFile = json['contractFile'];
    budget = json['budget'];
    status = json['status'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['location'] = location;
    data['contractFile'] = contractFile;
    data['budget'] = budget;
    data['status'] = status;
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    return data;
  }
}