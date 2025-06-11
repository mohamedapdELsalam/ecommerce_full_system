class UserModel {
  int? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? userPhone;
  String? userPhoto;
  int? userVerifycode;
  int? userApprove;
  String? userCreatetime;

  UserModel(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userPassword,
      this.userPhone,
      this.userPhoto,
      this.userVerifycode,
      this.userApprove,
      this.userCreatetime});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    userPhone = json['user_phone'];
    userPhoto = json['user_photo'];
    userVerifycode = json['user_verifycode'];
    userApprove = json['user_approve'];
    userCreatetime = json['user_createtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_password'] = userPassword;
    data['user_phone'] = userPhone;
    data['user_photo'] = userPhoto;
    data['user_verifycode'] = userVerifycode;
    data['user_approve'] = userApprove;
    data['user_createtime'] = userCreatetime;
    return data;
  }
}
