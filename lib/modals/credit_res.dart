class CreditRes {
  int? status;
  String? message;
  Data? data;
  String? timestamp;

  CreditRes({this.status, this.message, this.data, this.timestamp});

  CreditRes.fromJson(Map<String, dynamic> json) {
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
  List<Credits>? credits;

  Data({this.credits});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['credits'] != null) {
      credits = <Credits>[];
      json['credits'].forEach((v) {
        credits!.add(Credits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (credits != null) {
      data['credits'] = credits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Credits {
  int? id;
  int? credited;
  int? consumed;
  String? createdOn;
  String? updatedOn;

  Credits(
      {this.id, this.credited, this.consumed, this.createdOn, this.updatedOn});

  Credits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    credited = json['credited'];
    consumed = json['consumed'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['credited'] = credited;
    data['consumed'] = consumed;
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    return data;
  }
}
