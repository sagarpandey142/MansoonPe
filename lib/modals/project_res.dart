class ProjectRes {
  int? status;
  String? message;
  Data? data;
  String? timestamp;

  ProjectRes({this.status, this.message, this.data, this.timestamp});

  ProjectRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['timestamp'] = this.timestamp;
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
        projects!.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
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
  Credit? credit;
  List<Orders>? orders;
  String? createdOn;
  String? updatedOn;

  Projects(
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

  Projects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    contractFile = json['contractFile'];
    budget = json['budget'];
    status = json['status'];
    credit =
    json['credit'] != null ? new Credit.fromJson(json['credit']) : null;
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['contractFile'] = this.contractFile;
    data['budget'] = this.budget;
    data['status'] = this.status;
    if (this.credit != null) {
      data['credit'] = this.credit!.toJson();
    }
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    data['createdOn'] = this.createdOn;
    data['updatedOn'] = this.updatedOn;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['credited'] = this.credited;
    data['consumed'] = this.consumed;
    data['createdOn'] = this.createdOn;
    data['updatedOn'] = this.updatedOn;
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
  Null? supplierPayment;
  Null? contractorPayment;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['material'] = this.material;
    data['cost'] = this.cost;
    data['dueDate'] = this.dueDate;
    data['quoteFile'] = this.quoteFile;
    data['status'] = this.status;
    data['supplierPayment'] = this.supplierPayment;
    data['contractorPayment'] = this.contractorPayment;
    data['createdOn'] = this.createdOn;
    data['updatedOn'] = this.updatedOn;
    return data;
  }
}