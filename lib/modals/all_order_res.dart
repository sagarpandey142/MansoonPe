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
  dynamic dueDate;
  String? quoteFile;
  String? status;
  dynamic user;
  Project? project;
  SupplierPayment? supplierPayment;
  ContractorPayment? contractorPayment;
  String? createdOn;
  String? updatedOn;

  Orders(
      {this.id,
        this.material,
        this.cost,
        this.dueDate,
        this.quoteFile,
        this.status,
        this.user,
        this.project,
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
    user = json['user'];
    project =
    json['project'] != null ? Project.fromJson(json['project']) : null;
    supplierPayment = json['supplierPayment'] != null
        ? SupplierPayment.fromJson(json['supplierPayment'])
        : null;
    contractorPayment = json['contractorPayment'] != null
        ? ContractorPayment.fromJson(json['contractorPayment'])
        : null;
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
    data['user'] = user;
    if (project != null) {
      data['project'] = project!.toJson();
    }
    if (supplierPayment != null) {
      data['supplierPayment'] = supplierPayment!.toJson();
    }
    if (contractorPayment != null) {
      data['contractorPayment'] = contractorPayment!.toJson();
    }
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    return data;
  }
}

class Project {
  int? id;
  String? name;
  String? location;
  dynamic contractFile;
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

class SupplierPayment {
  int? id;
  int? amount;
  String? status;
  String? createdOn;
  String? updatedOn;

  SupplierPayment(
      {this.id, this.amount, this.status, this.createdOn, this.updatedOn});

  SupplierPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    status = json['status'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['status'] = status;
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    return data;
  }
}

class ContractorPayment {
  int? id;
  int? dueAmount;
  String? dueDate;
  List<Payments>? payments;
  String? createdOn;
  String? updatedOn;

  ContractorPayment(
      {this.id,
        this.dueAmount,
        this.dueDate,
        this.payments,
        this.createdOn,
        this.updatedOn});

  ContractorPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dueAmount = json['dueAmount'];
    dueDate = json['dueDate'];
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(Payments.fromJson(v));
      });
    }
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dueAmount'] = dueAmount;
    data['dueDate'] = dueDate;
    if (payments != null) {
      data['payments'] = payments!.map((v) => v.toJson()).toList();
    }
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    return data;
  }
}

class Payments {
  int? id;
  int? amount;
  String? mode;
  String? createdOn;
  String? updatedOn;

  Payments({this.id, this.amount, this.mode, this.createdOn, this.updatedOn});

  Payments.fromJson(Map<String, dynamic> json) {
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
