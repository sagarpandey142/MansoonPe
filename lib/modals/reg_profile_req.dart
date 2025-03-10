class RegProfileReq {
  String? gstNumber;
  String? panNumber;
  String? businessName;

  RegProfileReq({this.gstNumber, this.panNumber, this.businessName});

  RegProfileReq.fromJson(Map<String, dynamic> json) {
    gstNumber = json['gstNumber'];
    panNumber = json['panNumber'];
    businessName = json['businessName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gstNumber'] = gstNumber;
    data['panNumber'] = panNumber;
    data['businessName'] = businessName;
    return data;
  }
}