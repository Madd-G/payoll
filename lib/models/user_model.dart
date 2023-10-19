class UserModel {
  String? id;
  String? name;
  String? email;

  UserModel(
      {this.id, required this.name, required this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['data']['_id'];
    name = json['data']['name'];
    email = json['data']['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data']['_id'] = id;
    data['data']['name'] = name;
    data['data']['email'] = email;
    return data;
  }
}
