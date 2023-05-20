class Teacher {
  int? id;
  String? useId;
  String? name;
  String? desc;
  String? gender;
  String? image;
  String? bannerImage;
  String? specialty;
  int? rate;
  int? status;
  int? countStudent;
  String? country;
  String? createdAt;

  Teacher(
      {this.id,
      this.useId,
      this.name,
      this.desc,
      this.gender,
      this.image,
      this.bannerImage,
      this.specialty,
      this.rate,
      this.status,
      this.countStudent,
      this.country,
      this.createdAt});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    useId = json['useId'];
    name = json['name'];
    desc = json['desc'];
    gender = json['gender'];
    image = json['image'];
    bannerImage = json['bannerImage'];
    specialty = json['specialty'];
    rate = json['rate'];
    status = json['status'];
    countStudent = json['countStudent'];
    country = json['country'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['useId'] = this.useId;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['bannerImage'] = this.bannerImage;
    data['specialty'] = this.specialty;
    data['rate'] = this.rate;
    data['status'] = this.status;
    data['countStudent'] = this.countStudent;
    data['country'] = this.country;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
