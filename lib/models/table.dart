class TableModel {
  int? id;
  String? userId;
  int? status;
  String? fromHours;
  String? toHours;
  String? link;
  String? note;
  String? today;
  String? dateToday;
  String? createdAt;

  TableModel(
      {this.id,
      this.userId,
      this.status,
      this.fromHours,
      this.toHours,
      this.link,
      this.note,
      this.today,
      this.dateToday,
      this.createdAt});

  TableModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    status = json['status'];
    fromHours = json['fromHours'];
    toHours = json['toHours'];
    link = json['link'];
    note = json['note'];
    today = json['today'];
    dateToday = json['dateToday'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['userId'] = userId;
    data['status'] = status;
    data['fromHours'] = fromHours;
    data['toHours'] = toHours;
    data['link'] = link;
    data['note'] = note;
    data['today'] = today;
    data['dateToday'] = dateToday;
    data['createdAt'] = createdAt;
    return data;
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
