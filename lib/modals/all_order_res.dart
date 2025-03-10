class AllOrdersRes {
  int? status;
  String? message;
  Data? data;
  String? timestamp;

  AllOrdersRes({this.status, this.message, this.data, this.timestamp});

  AllOrdersRes.fromJson(Map<String, dynamic> json) {
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
  List<Orders>? orders;

  Data({this.orders});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  String? material;
  int? cost;
  String? dueDate;
  String? quoteFile;
  String? status;
  dynamic supplierPayment;
  dynamic contractorPayment;
  String? createdOn;
  String? updatedOn;

  Orders(
      {this.id,
        this.material,
        this.cost,
        this.dueDate,
        this.quoteFile,
        this.status,
        this.supplierPayment,
        this.contractorPayment,
        this.createdOn,
        this.updatedOn});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    material = json['material'];
    cost = json['cost'];
    dueDate = json['dueDate'];
    quoteFile = json['quoteFile'];
    status = json['status'];
    supplierPayment = json['supplierPayment'];
    contractorPayment = json['contractorPayment'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['material'] = material;
    data['cost'] = cost;
    data['dueDate'] = dueDate;
    data['quoteFile'] = quoteFile;
    data['status'] = status;
    data['supplierPayment'] = supplierPayment;
    data['contractorPayment'] = contractorPayment;
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    return data;
  }
}