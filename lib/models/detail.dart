class Detail {
  String city;
  String job;

  Detail(this.city, this.job);

  Detail.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['job'] = this.job;
    return data;
  }
}
