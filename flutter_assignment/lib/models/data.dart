

class data {
  final int? id;
  final String? name;
  final String? mobile_no;

  data({this.id, this.name, this.mobile_no});

  data.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        mobile_no = res["mobile_no"].toString();

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'mobile_no': mobile_no,
    };
  }
}
