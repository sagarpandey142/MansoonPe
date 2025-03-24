class ContPayRes {
  int? status;
  String? message;
  Data? data;
  String? timestamp;

  ContPayRes({this.status, this.message, this.data, this.timestamp});

  ContPayRes.fromJson(Map<String, dynamic> json) {
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
  Payment? payment;

  Data({this.payment});

  Data.fromJson(Map<String, dynamic> json) {
    payment =
    json['payment'] != null ? Payment.fromJson(json['payment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    return data;
  }
}

class Payment {
  int? id;
  int? amount;
  String? mode;
  String? createdOn;
  String? updatedOn;

  Payment({this.id, this.amount, this.mode, this.createdOn, this.updatedOn});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    mode = json['mode'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['mode'] = mode;
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    return data;
  }
}
