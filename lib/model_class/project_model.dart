class ProjectModel {
  String title;
  String date;
  String cost;
  String consumption;
  String status;
  int statusColor;
  String? pending;
  String? buttonText;
  String? message;
  String statusType;
  String image;

  ProjectModel({
    required this.title,
    required this.date,
    required this.cost,
    required this.consumption,
    required this.status,
    required this.statusColor,
    this.pending,
    this.buttonText,
    this.message,
    required this.statusType,
    required this.image
  });
}
