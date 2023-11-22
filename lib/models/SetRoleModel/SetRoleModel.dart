class SetRoleModel {
  SetRoleModel({
     this.status,
     this.message,
     this.token,
     this.userId,
  });
 String ?status;
 String ?message;
  String? token;
int? userId;

  SetRoleModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    token = json['token'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['token'] = token;
    _data['user_id'] = userId;
    return _data;
  }
}