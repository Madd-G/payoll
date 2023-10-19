class SignInModel {
  String? token;

  SignInModel({this.token});

  SignInModel.fromJson(Map<String, dynamic> json) {
    token = json['data']['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data']['token'] = token;
    return data;
  }
}
