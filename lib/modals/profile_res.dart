class ProfileRes {
  int? status;
  String? message;
  Data? data;
  String? timestamp;

  ProfileRes({this.status, this.message, this.data, this.timestamp});

  ProfileRes.fromJson(Map<String, dynamic> json) {
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
  Profile? profile;

  Data({this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? gstNumber;
  String? panNumber;
  String? businessName;
  String? createdOn;
  String? updatedOn;

  Profile(
      {this.id,
        this.gstNumber,
        this.panNumber,
        this.businessName,
        this.createdOn,
        this.updatedOn});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gstNumber = json['gstNumber'];
    panNumber = json['panNumber'];
    businessName = json['businessName'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gstNumber'] = gstNumber;
    data['panNumber'] = panNumber;
    data['businessName'] = businessName;
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    return data;
  }
}