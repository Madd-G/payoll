class PasswordModel {
  String? oldPassword;
  String? newPassword;

  PasswordModel({required this.newPassword, required this.oldPassword});

  PasswordModel.fromJson(Map<String, dynamic> json) {
    oldPassword = json['old_password'];
    newPassword = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['old_password'] = oldPassword;
    data['new_password'] = newPassword;
    return data;
  }
}
