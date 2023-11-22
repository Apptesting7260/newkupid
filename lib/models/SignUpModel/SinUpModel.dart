class SignUpModel {
  SignUpModel({
     this.status,
     this.msg,
    this.otp
  });
   String ?status;
   String? msg;
   String? otp;
  
  SignUpModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['message'];
    otp = json['otp'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = msg;
    _data['otp'] = otp;
    return _data;
  }
}