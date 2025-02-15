class RegProfileRes {
  int? id;
  String? gstNumber;
  String? panNumber;
  String? businessName;

  RegProfileRes({this.id, this.gstNumber, this.panNumber, this.businessName});

  RegProfileRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gstNumber = json['gstNumber'];
    panNumber = json['panNumber'];
    businessName = json['businessName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gstNumber'] = gstNumber;
    data['panNumber'] = panNumber;
    data['businessName'] = businessName;
    return data;
  }
}
