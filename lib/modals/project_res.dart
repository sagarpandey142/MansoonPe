class ProjectRes {
  int? status;
  String? message;
  Data? data;
  String? timestamp;

  ProjectRes({this.status, this.message, this.data, this.timestamp});

  ProjectRes.fromJson(Map<String, dynamic> json) {
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
  List<Projects>? projects;

  Data({this.projects});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (projects != null) {
      data['projects'] = projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  int? id;
  String? name;
  String? location;
  String? contractFile;
  int? budget;
  String? status;
  String? createdOn;
  String? updatedOn;

  Projects(
      {this.id,
        this.name,
        this.location,
        this.contractFile,
        this.budget,
        this.status,
        this.createdOn,
        this.updatedOn});

  Projects.fromJson(Map<String, dynamic> json) {
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
