class AddMaterialReq {
  String? material;
  String? cost;
  String? quoteFile;
  String? dueDate;

  AddMaterialReq({this.material, this.cost, this.quoteFile, this.dueDate});

  AddMaterialReq.fromJson(Map<String, dynamic> json) {
    material = json['material'];
    cost = json['cost'];
    quoteFile = json['quoteFile'];
    dueDate = json['dueDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['material'] = material;
    data['cost'] = cost;
    data['quoteFile'] = quoteFile;
    data['dueDate'] = dueDate;
    return data;
  }
}