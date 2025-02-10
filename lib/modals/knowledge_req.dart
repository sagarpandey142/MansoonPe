class KnowledgeReq {
  String? loginMobileNo;

  KnowledgeReq({this.loginMobileNo});

  KnowledgeReq.fromJson(Map<String, dynamic> json) {
    loginMobileNo = json['LoginMobileNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LoginMobileNo'] = loginMobileNo;
    return data;
  }
}