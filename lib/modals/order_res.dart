class OrdersRes {
  int? status;
  String? message;
  Data? data;
  String? timestamp;

  OrdersRes({this.status, this.message, this.data, this.timestamp});

  OrdersRes.fromJson(Map<String, dynamic> json) {
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
  Credit? credit;
  List<Orders>? orders;
  String? createdOn;
  String? updatedOn;

  Project(
      {this.id,
        this.name,
        this.location,
        this.contractFile,
        this.budget,
        this.status,
        this.credit,
        this.orders,
        this.createdOn,
        this.updatedOn});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    contractFile = json['contractFile'];
    budget = json['budget'];
    status = json['status'];
    credit =
    json['credit'] != null ? Credit.fromJson(json['credit']) : null;
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
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
    if (credit != null) {
      data['credit'] = credit!.toJson();
    }
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    return data;
  }
}

class Credit {
  int? id;
  int? credited;
  int? consumed;
  String? createdOn;
  String? updatedOn;

  Credit(
      {this.id, this.credited, this.consumed, this.createdOn, this.updatedOn});

  Credit.fromJson(Map<String, dynamic> json) {
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