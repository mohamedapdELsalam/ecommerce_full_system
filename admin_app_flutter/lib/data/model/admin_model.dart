class AdminModel {
  int? adminsId;
  String? adminsName;
  String? adminsEmail;
  String? adminsPassword;
  String? adminsPhone;
  String? adminsPhoto;
  int? adminsVerifycode;
  int? adminsApprove;
  String? adminsCreatetime;

  AdminModel(
      {this.adminsId,
      this.adminsName,
      this.adminsEmail,
      this.adminsPassword,
      this.adminsPhone,
      this.adminsPhoto,
      this.adminsVerifycode,
      this.adminsApprove,
      this.adminsCreatetime});

  AdminModel.fromJson(Map<String, dynamic> json) {
    adminsId = json['admins_id'];
    adminsName = json['admins_name'];
    adminsEmail = json['admins_email'];
    adminsPassword = json['admins_password'];
    adminsPhone = json['admins_phone'];
    adminsPhoto = json['admins_photo'];
    adminsVerifycode = json['admins_verifycode'];
    adminsApprove = json['admins_approve'];
    adminsCreatetime = json['admins_createtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admins_id'] = adminsId;
    data['admins_name'] = adminsName;
    data['admins_email'] = adminsEmail;
    data['admins_password'] = adminsPassword;
    data['admins_phone'] = adminsPhone;
    data['admins_photo'] = adminsPhoto;
    data['admins_verifycode'] = adminsVerifycode;
    data['admins_approve'] = adminsApprove;
    data['admins_createtime'] = adminsCreatetime;
    return data;
  }
}