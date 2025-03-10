class AddMaterialRes {
  int? status;
  String? message;
  Data? data;
  String? timestamp;

  AddMaterialRes({this.status, this.message, this.data, this.timestamp});

  AddMaterialRes.fromJson(Map<String, dynamic> json) {
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
  Order? order;

  Data({this.order});

  Data.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Order {
  int? id;
  String? material;
  int? cost;
  String? dueDate;
  String? quoteFile;
  String? status;
  Null supplierPayment;
  Null contractorPayment;
  String? createdOn;
  String? updatedOn;

  Order(
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

  Order.fromJson(Map<String, dynamic> json) {
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