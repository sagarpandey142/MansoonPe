class DownloadRes {
  int? status;
  String? message;
  Data? data;
  String? timestamp;

  DownloadRes({this.status, this.message, this.data, this.timestamp});

  DownloadRes.fromJson(Map<String, dynamic> json) {
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
  String? fileBytes;

  Data({this.fileBytes});

  Data.fromJson(Map<String, dynamic> json) {
    fileBytes = json['fileBytes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fileBytes'] = fileBytes;
    return data;
  }
}