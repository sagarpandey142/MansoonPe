class CreateProjectReq {
  String? name;
  String? location;
  String? budget;
  String? contractFile;

  CreateProjectReq({this.name, this.location, this.budget, this.contractFile});

  CreateProjectReq.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    budget = json['budget'];
    contractFile = json['contractFile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['location'] = location;
    data['budget'] = budget;
    data['contractFile'] = contractFile;
    return data;
  }
}