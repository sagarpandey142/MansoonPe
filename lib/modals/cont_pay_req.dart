class ContPayReq {
  String? amount;
  String? mode;

  ContPayReq({this.amount, this.mode});

  ContPayReq.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['mode'] = mode;
    return data;
  }
}
