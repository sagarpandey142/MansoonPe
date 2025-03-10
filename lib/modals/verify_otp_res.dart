class VerifyOtpRes {
  int? status;
  String? message;
  Data? data;
  String? timestamp;

  VerifyOtpRes({this.status, this.message, this.data, this.timestamp});

  VerifyOtpRes.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  int? phoneNumber;
  UserProfile? userProfile;
  List<dynamic>? projects;

  User({this.id, this.phoneNumber, this.userProfile, this.projects});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    userProfile = json['userProfile'] != null
        ? UserProfile.fromJson(json['userProfile'])
        : null;
    if (json['projects'] != null) {
      projects = <dynamic>[];
      json['projects'].forEach((v) {
        projects!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phoneNumber'] = phoneNumber;
    if (userProfile != null) {
      data['userProfile'] = userProfile!.toJson();
    }
    if (projects != null) {
      data['projects'] = projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserProfile {
  int? id;
  String? gstNumber;
  String? panNumber;
  String? businessName;
  String? createdOn;
  String? updatedOn;

  UserProfile(
      {this.id,
        this.gstNumber,
        this.panNumber,
        this.businessName,
        this.createdOn,
        this.updatedOn});

  UserProfile.fromJson(Map<String, dynamic> json) {
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