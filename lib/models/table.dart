class TableModel {
  int? id;
  String? userId;
  int? teacherId;
  int? status;
  String? hours;
  String? link;
  String? note;
  String? today;
  String? dateToday;
  String? createdAt;

  TableModel(
      {this.id,
      this.userId,
      this.teacherId,
      this.status,
      this.hours,
      this.link,
      this.note,
      this.today,
      this.dateToday,
      this.createdAt});

  TableModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    teacherId = json['teacherId'];
    status = json['status'];
    hours = json['hours'];
    link = json['link'];
    note = json['note'];
    today = json['today'];
    dateToday = json['dateToday'];
    createdAt = json['createdAt'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['userId'] = this.userId;
  //   data['teacherId'] = this.teacherId;
  //   data['status'] = this.status;
  //   data['hours'] = this.hours;
  //   data['link'] = this.link;
  //   data['note'] = this.note;
  //   data['today'] = this.today;
  //   data['dateToday'] = this.dateToday;
  //   data['createdAt'] = this.createdAt;
  //   return data;
  // }
}
