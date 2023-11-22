class UserLoginModel {
  UserLoginModel({
    this.status,
    this.message,
    this.token,
    this.tokenId,
    this.currentStep,
    this.userType,
  });

  String? status;
  String? message;
  String? token;
  dynamic tokenId;
 dynamic currentStep;
  String? userType;

  // Use factory constructor to create a UserLoginModel instance
  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      status: json['status']!=null?json['status']:"",
      message: json['message']!=null?json['message']:"",
      token: json['token']!=null?json['token']:"",
      tokenId: json['token_id']!=null?json['token_id']:"" , // Use "as int?" to handle possible null values
      currentStep: json['current_step'] !=null?json['current_step']:"" , // Use "as int?" to handle possible null values
      userType: json['user_type']!=null?json['user_type']:"",
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['token'] = token;
    _data['token_id'] = tokenId;
    _data['current_step'] = currentStep;
    _data['user_type'] = userType;
    return _data;
  }
}
